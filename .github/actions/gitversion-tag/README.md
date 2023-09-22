# GitHub Action for find semver and tag the main branch

The action finds the semver on the branch and adds a git tag on the `main` branch
if it does not already exist.

:exclamation: NOTE: Tagging is skipped if the tag exists.

## Usage

```yaml
- name: Tag GitVersion
  id: gitversion_tag
  uses: evoy-as/.github/.github/actions/gitversion-tag@main
```
