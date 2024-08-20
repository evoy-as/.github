# GitHub Action for creating and pushing a Git tag.

The action creates a Git tag and pushes the tag to the origin.

Read more about tagging at [Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging).

## TODO

- Consider adding logic for signed and verified tags with GPG. Read more about it at [Signing tags - GitHub Docs](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-tags) and [Git - Signing Your Work](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work).

## Usage

:exclamation: The action requires the `content: write` permission to be able to push the tag to origin. See [Assigning permissions to jobs](https://docs.github.com/en/actions/using-jobs/assigning-permissions-to-jobs).

```yaml
- uses: evoy-as/.github/.github/actions/git-tag@main
  with:
    # Add an annotated tag. The provided string will be used as the annotation message. Defaults to null.
    annotation: "My annotated message."
    # Replace an existing tag with the given name (instead of failing). Defaults to false.
    force: true
    # The tagname.
    tag: v1.2.3
    # The email to use for the tagger in the annotated tag. Defaults to github-actions[bot]@users.noreply.github.com.
    user-email: github-actions@github.com
    # The name to use for the tagger in the annotated tag. Defaults to github-actions.
    user-name: github-actions
```

### Example of lightweight tag

A lightweight tag requires a bare minimum of information, as it is just a pointer to a specific commit. The following example shows how to create a lightweight tag using this action:

```yaml
permissions:
  content: write

jobs:
  tag:
    name: Create lightweight tag
    runs-on: ubuntu-latest
    steps:
      - uses: evoy-as/.github/.github/actions/git-tag@main
        with:
          tag: v1.2.3
```

### Example of annotated tag

The annotated tag will default to using the **github-actions[bot]** user as the tagger.

```yaml
permissions:
  content: write

jobs:
  tag:
    name: Create annotated tag
    runs-on: ubuntu-latest
    steps:
      - uses: evoy-as/.github/.github/actions/git-tag@main
        with:
          annotation: "My annotated tag"
          tag: v1.2.3
```

### Example of annotated tag with user information from HEAD reference

```yaml
permissions:
  content: write

jobs:
  tag:
    name: Create annotated tag with user from HEAD reference
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - id: author
        run: |
          echo "name=$(git log -n 1 --pretty=format:%an)" >> "$GITHUB_OUTPUT"
          echo "email=$(git log -n 1 --pretty=format:%ae)" >> "$GITHUB_OUTPUT"

      - uses: evoy-as/.github/.github/actions/git-tag@main
        with:
          annotation: "My annotated tag"
          tag: v1.2.3
          user-email: ${{ steps.author.outputs.email }}
          user-name: ${{ steps.author.outputs.name }}
```
