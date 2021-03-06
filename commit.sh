#!/bin/bash

#tutorial: https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php

repository_name=bash-test
repository_path=git@github.com:burczyk/$repository_name.git

function replace_and_commit {
  cp commit.sh $repository_name
  cd $repository_name
  git add .
  git commit -m "Updated files"
  git push origin master
}

function update_podspec_version {
  #sed "s/s.version[ \t]*=.*/s.version  = \'1.2.3\'/g" afnetworking.podspec
  local latest_tag=git describe --tags $(git rev-list --tags --max-count=1)
}

if [ -d $repository_name ]
then
  echo $repository_name exists - pulling newest data
  cd $repository_name
  git pull origin master
  cd ..
  replace_and_commit
else
  echo $repository_name does not exist - cloning
  git clone $repository_path
  replace_and_commit
fi
