#!/usr/bin/bash
targetdir="/usr/share/elasticsearch/config/analysis-ik"
for file in $targetdir/*.dic; do
    if [ -f $file ]; then
      echo "convert to Traditional Chinese:" $file;
      opencc -i $file -o $file -c s2t.json;
    fi
done
