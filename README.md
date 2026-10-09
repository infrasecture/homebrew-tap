# homebrew-tap

Homebrew tap for Infrasecture CLI tools.

## Publish hcorral

After the launcher release is public, run this repository's workflow:

```console
gh workflow run update-hcorral.yaml --repo infrasecture/homebrew-tap -f version=vX.Y.Z
```

It verifies the public Darwin archives against their checksums and release
manifest, generates the formula from the annotated release source, and commits
it using this repository's automatically provided `GITHUB_TOKEN`. No personal
token or cross-repository write credential is needed. Retries verify matching
formulas; older versions and conflicting bytes are refused.

## Install

```bash
brew tap infrasecture/tap
brew install vaka

# or track nightly builds
brew install vaka-nightly
```

## Notes

- This tap is packaging-only. Report bugs and feature requests in the main repo:
  https://github.com/infrasecture/vaka/issues
- The formulas install release bundles published by the main vaka repository.
