# Git Sync

A GitHub Action for syncing between two independent repositories using **force push**. 


## Features
 * Sync branches between two GitHub repositories
 * Sync branches to/from a remote repository
 * GitHub action can be triggered on a timer or on push


## Usage

### GitHub Actions
```
# File: .github/workflows/repo-sync.yml

name: CI

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name: repo-sync
      uses: dlangheiter-tgm/git-sync@master
      with:
        destination_repo: 'dlangheiter-tgm/test'
        ssh_private_key: ${{ secrets.PRIVATE_KEY }}
```
`ssh_private_key` can be omitted if using authenticated HTTPS repo clone urls like `https://username:access_token@github.com/username/repository.git`.

### Inputs

| name               | value  | default      | description                                      |
| ------------------ | ------ | ------------ | ------------------------------------------------ |
| source_repo        | string | $GITHUB_REPO | Source repo to pull.                             |
| source_branch      | string | $GITHUB_REF  | Source branch to pull.                           |
| destination_repo   | string |              | Destination repo to push.                        |
| destination_branch | string | $GITHUB_REF  | Destination branch to push.                      |
| ssh_private_key    | string |              | SSH Private key for auth at the destination repo |


#### Advanced: Sync all branches

To Sync all branches from source to destination, use `SOURCE_BRANCH: "refs/remotes/source/*"` and `DESTINATION_BRANCH: "refs/heads/*"`. But be careful, branches with the same name including `master` will be overwritten.

## Author
[David Langheiter](https://github.com/dlangheiter-tgm) _david@langheiter.com_

## License
[MIT](https://wei.mit-license.org)
