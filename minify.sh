#! /bin/bash
# Search for all of the JSON files in the current project and
# minify them using the npm minify tool.
ERROR="ERROR:\n------\njson-minify is not installed. To install:\n
$ npm install -g json-minify"

type json-minify >/dev/null 2>&1 || { echo >&2 $ERROR; exit 1; }
find . -name '*.json'|grep -v 'min.json'|while read raw; do
    out=$(echo "$raw" | sed 's/\.json/.min.json/g');
    cat $raw | json-minify > $out;
done
