#!/bin/sh

set -e

SOURCE_REPO=${INPUT_SOURCE_REPO:-$GITHUB_REPOSITORY}
SOURCE_BRANCH=${INPUT_SOURCE_BRANCH:-$GITHUB_REF}
DESTINATION_REPO=$INPUT_DESTINATION_REPO
DESTINATION_BRANCH=${INPUT_DESTINATION_BRANCH:-$GITHUB_REF}
SSH_PRIVATE_KEY=$INPUT_SSH_PRIVATE_KEY

echo "SRC_REPO=$SOURCE_REPO"
echo "SRC_BRANCH=$SOURCE_BRANCH"
echo "DST_REPO=$DESTINATION_REPO"
echo "DST_BRANCH=$DESTINATION_BRANCH"

if ! echo $SOURCE_REPO | grep '.git'
then
  if [[ -n "$SSH_PRIVATE_KEY" ]]
  then
    SOURCE_REPO="git@github.com:${SOURCE_REPO}.git"
    GIT_SSH_COMMAND="ssh -v"
  else
    SOURCE_REPO="https://github.com/${SOURCE_REPO}.git"
  fi
fi
if ! echo $DESTINATION_REPO | grep '.git'
then
  if [[ -n "$SSH_PRIVATE_KEY" ]]
  then
    DESTINATION_REPO="git@github.com:${DESTINATION_REPO}.git"
    GIT_SSH_COMMAND="ssh -v"
  else
    DESTINATION_REPO="https://github.com/${DESTINATION_REPO}.git"
  fi
fi

echo "SOURCE=$SOURCE_REPO:$SOURCE_BRANCH"
echo "DESTINATION=$DESTINATION_REPO:$DESTINATION_BRANCH"

git clone "$SOURCE_REPO" --origin source && cd `basename "$SOURCE_REPO" .git`
git remote add destination "$DESTINATION_REPO"
git push destination "${SOURCE_BRANCH}:${DESTINATION_BRANCH}" -f
