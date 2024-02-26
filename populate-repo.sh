#!/bin/bash

echo "Setting up"
HERE=$(dirname "$(realpath "$0")")
TMPDIR=$(mktemp -d)

cd $TMPDIR
echo "Fetching file and unzipping to temp folder ($TMPDIR)"
wget https://sustainable-rails.com/assets/sample-code.zip
unzip sample-code.zip
rm sample-code.zip

echo "Back to the repo ($HERE)"
cd $HERE
 
for FOLDER in $TMPDIR/*; do
  SECTION=`basename $FOLDER`
  BRANCH="section-$SECTION"

  echo "Create a new branch"
  git branch -D $BRANCH
  git co -b $BRANCH
  rm populate-repo.sh
  cp -R $FOLDER/widgets/* . 
  git add .
  git commit -am "Section $SECTION edits."

  echo "Back to main (and do some cleanup)"
  git co main
  git reset --hard head
  git clean -df
done

rm -fR $TMPDIR
