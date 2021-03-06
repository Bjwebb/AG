#!/bin/bash

cd /opt/cove
echo "$(</dev/stdin)" > /tmp/file.xml
CMD="/opt/cove/iati-cli -d -o /tmp/out /tmp/file.xml"
$CMD > /dev/null 2>&1
XML=/tmp/out/unflattened.xml
ERR=/tmp/out/results.json
if [ -e "$XML" ]; then
  cat $XML
fi
if [ -e "$ERR" ]; then
  (>&2 /bin/cat $ERR)
fi
