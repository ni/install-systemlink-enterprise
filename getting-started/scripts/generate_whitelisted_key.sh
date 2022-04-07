#! /bin/bash
# Generate whitelisted key for SystemLink Enterprise

if ! command -v sha512 &> /dev/null
then
  echo "This script requires the sha512 command."
  return
fi

KEY=`head -c42 < /dev/urandom | base64`
echo "key: $KEY"

HASH=`echo $KEY | sha512 -x`
echo "hash: $HASH"
