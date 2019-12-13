# Git Sync

A GitHub Action for syncing between two independent repositories using **force push**. 


## Features
 * Sync branches between two GitHub repositories
 * Sync branches to/from a remote repository
 * GitHub action can be triggered on a timer or on push
 * To sync with current repository, please checkout [Github Repo Sync](https://github.com/marketplace/actions/github-repo-sync)


## Usage

### GitHub Actions
This is not accurate at the moment. 
```
# File: .github/workflows/repo-sync.yml

on: push
jobs:
  repo-sync:
    runs-on: ubuntu-latest
    steps:
    - name: repo-sync
      uses: wei/git-sync@v1
      with:
        SOURCE_REPO: ""
        SOURCE_BRANCH: ""
        DESTINATION_REPO: ""
        DESTINATION_BRANCH: ""
        SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
```
`SSH_PRIVATE_KEY` can be omitted if using authenticated HTTPS repo clone urls like `https://username:access_token@github.com/username/repository.git`.

#### Advanced: Sync all branches

To Sync all branches from source to destination, use `SOURCE_BRANCH: "refs/remotes/source/*"` and `DESTINATION_BRANCH: "refs/heads/*"`. But be careful, branches with the same name including `master` will be overwritten.

## Author
[David Langheiter](https://github.com/dlangheiter-tgm) _david@langheiter.com_

## License
[MIT](https://wei.mit-license.org)
