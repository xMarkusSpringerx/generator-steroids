#!/bin/sh

head -n 20 CHANGELOG.md

echo "is changelog ok?"
read

echo "versioning the npm, now it's a good time to control+c if you don't want to patch ?"

read

DEFAULTSEVERITY=patch
SEVERITY=${1:-$DEFAULTSEVERITY}

npm version $SEVERITY && git push && git push --tags && npm publish ./

echo "DONE"