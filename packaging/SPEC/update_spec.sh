#!/bin/bash

PATCHLEVEL=$(git rev-list --count master)
COMMITHASH=$(git rev-parse HEAD)
MYCHANGELOG=$(LANG=en git log --pretty=format:"* %cd %an <%ae>%n- %s%n" --date=format:"%a %b %d %Y" -n 10| sed 's/$/ \\/')

echo "%define patchlevel $PATCHLEVEL" > wine-nine-unstable.spec
echo "%define commithash $COMMITHASH" >> wine-nine-unstable.spec
echo "%define mychangelog $MYCHANGELOG" >> wine-nine-unstable.spec
cat wine-nine-unstable.spec.tmpl >> wine-nine-unstable.spec
         
