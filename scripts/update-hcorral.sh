#!/usr/bin/env bash
set -euo pipefail

[[ "${GITHUB_ACTIONS:-}" == true && "${GITHUB_REPOSITORY:-}" == infrasecture/homebrew-tap && "${GITHUB_REF_NAME:-}" == main ]] || {
  echo 'ERROR: run the Update hcorral formula workflow on main' >&2; exit 1;
}
# The workflow checks out the immutable annotated release source, without
# retaining credentials. Use the same generator that qualified its formula.
# shellcheck source=/dev/null
source release-source/scripts/lib/release-versioning.sh
hcorral_require_stable_version "$VERSION"
work="$(mktemp -d)"
trap 'rm -rf -- "$work"' EXIT
gh release download "$VERSION" --repo infrasecture/hcorral --dir "$work" \
  --pattern "hcorral_${VERSION#v}_darwin_*.tar.gz" --pattern SHA256SUMS --pattern component-manifest.json
for arch in amd64 arm64; do test -s "$work/hcorral_${VERSION#v}_darwin_$arch.tar.gz"; done
(cd "$work" && sha256sum --check --ignore-missing SHA256SUMS)
jq -e --arg version "$VERSION" --arg commit "$SOURCE_COMMIT" \
  '.schema == 1 and .component == "hcorral" and .version == $version and .commit == $commit' "$work/component-manifest.json" >/dev/null
for arch in amd64 arm64; do
  archive="hcorral_${VERSION#v}_darwin_$arch.tar.gz"
  checksum="$(hcorral_sha256_file "$work/$archive")"
  jq -e --arg name "$archive" --arg sha "$checksum" \
    '[.artifacts[] | select(.name == $name)] | length == 1 and .[0].sha256 == $sha' "$work/component-manifest.json" >/dev/null
done
hcorral_write_homebrew_formula "$VERSION" "$work"
formula=Formula/hcorral.rb
if [[ -f "$formula" ]]; then
  previous="$(sed -nE 's@.*releases/download/(v[0-9]+\.[0-9]+\.[0-9]+)/.*@\1@p' "$formula" | sort -u)"
  hcorral_require_stable_version "$previous"
  [[ "$(printf '%s\n' "$previous" "$VERSION" | sort -V | tail -n1)" == "$VERSION" ]] || { echo 'ERROR: refusing a formula downgrade' >&2; exit 1; }
  if [[ "$previous" == "$VERSION" ]]; then
    cmp "$formula" "$work/$formula" || { echo 'ERROR: published formula conflicts with this version' >&2; exit 1; }
    echo "Formula already matches $VERSION and its public archive checksums." >>"$GITHUB_STEP_SUMMARY"
    exit 0
  fi
fi
mkdir -p Formula
cp "$work/$formula" "$formula"
git diff --check
git config user.name 'github-actions[bot]'
git config user.email '41898282+github-actions[bot]@users.noreply.github.com'
git add -- "$formula"
git commit -m "hcorral $VERSION"
git push origin HEAD:main
gh api 'repos/infrasecture/homebrew-tap/contents/Formula/hcorral.rb?ref=main' --jq .content | base64 --decode >"$work/public.rb"
cmp "$formula" "$work/public.rb"
printf 'Published and verified hcorral %s from %s.\n' "$VERSION" "$SOURCE_COMMIT" >>"$GITHUB_STEP_SUMMARY"
