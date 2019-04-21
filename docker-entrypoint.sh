#!/bin/sh
set -e
if [ -z "$INDICIES" ]; then
  cat >&2 <<EOF
No Index Specified.
EOF
  exit 1
elif [ -z "$ORIGIN" ]; then
  cat >&2 <<EOF
No Origin ElasticSearch Specified.
EOF
  exit 1
elif [ -z "$DEST" ]; then
  cat >&2 <<EOF
No Destination ElasticSearch Specified.
EOF
  exit 1    
else
  for index in ${INDICIES//,/ }
  do

    { elasticdump --input=$ORIGIN/$index --output=$DEST/$index --type=analyzer; elasticdump --input=$ORIGIN/$index --output=$DEST/$index --type=mapping; sleep 5;elasticdump --input=$ORIGIN/$index --output=$DEST/$index --type=data ; sleep 5; } &
  done
  wait
fi
exec "$@"