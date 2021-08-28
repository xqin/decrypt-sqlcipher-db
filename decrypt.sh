#!/bin/bash
db="$1"

if [ -z "$db" ]; then
  echo "nothing to do :P"
  exit
fi

if [ ! -f "$db" ]; then
  echo "source [$db] not exists :("
  exit 1
fi

key="$2"

if [ -z "$key" ]; then
  echo "decrypt key missing :("
  exit 2
fi

cd $(dirname "$db")

filename="$3"

if [ -z "$filename" ]; then
  filename="decrypted_database.db"
fi

if [ -f "$filename" ]; then
  echo "target [$filename] already exists :("
  exit 3
fi

echo "decrypt ..."

cat <<SQL | sqlcipher "$db" > /dev/null && echo "decrypt success :)"
PRAGMA key = "${key}";
PRAGMA cipher_use_hmac = ON;
PRAGMA cipher_page_size = 1024;
PRAGMA kdf_iter = 64000;
PRAGMA cipher_hmac_algorithm = HMAC_SHA1;
PRAGMA cipher_kdf_algorithm = PBKDF2_HMAC_SHA1;
ATTACH DATABASE "${filename}" AS decrypted_database KEY "";
SELECT sqlcipher_export("decrypted_database");
DETACH DATABASE decrypted_database;
SQL