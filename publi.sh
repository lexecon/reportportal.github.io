#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

# publi.sh

echo "$GIT_RSA" > ~/.ssh/id_rsa

# change the branch names appropriately
# git checkout develop

npm run build

git config --global user.email "$USER_EMAIL";
git config --global user.name "$USER_NAME";
git remote set-url origin git@github.com:lexecon/reportportal.github.io.git;


git add --force dist;

git commit -m "`date`";

echo "$USER_EMAIL"
git push -f origin HEAD:gh-pages

# echo "Push subtree to master"
# git subtree split --prefix dist -b temp; # create a local temp branch containing the splitted output folder
# git push -f origin temp:gh-pages # force the push of the gh-pages branch to the remote gh-pages branch at origin
# git branch -D temp # delete the local gh-pages because you will need it: ref
