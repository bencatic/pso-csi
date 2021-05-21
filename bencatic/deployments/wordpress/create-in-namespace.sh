#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Provide a namespace name as the first and only argument!"
  exit 1
fi

if [ $(echo -n $1 | wc -c) -gt 63 ]; then
  echo "Namespace cannot be longer than 63 chars!"
  exit 1
fi

namespace="$1"
sourcefile='wordpress.yaml'
targetfile=${namespace}.yaml

# copy wordpress.yaml to a new file
cp wordpress.yaml $targetfile

sed -i "0,/wordpress/s//$namespace/" $targetfile
sed -i "s/namespace: wordpress/namespace: $namespace/g" $targetfile
