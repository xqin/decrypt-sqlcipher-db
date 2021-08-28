# decrypt-sqlcipher-db

Decrypt sqlcipher db with sqlcipher v3.4.1-2

---

### Usage Example

```bash

docker build . -t sqlcipher

docker run --rm -it -v `pwd`:/tmp sqlcipher /tmp/xxx.db "encrypt-key"

docker run --rm -it -v `pwd`:/tmp sqlcipher /tmp/xxx.db "encrypt-key" decrypt.db

# or raw key

docker run --rm -it -v `pwd`:/tmp sqlcipher /tmp/xxx.db "x'hex-string-in-here'"

docker run --rm -it -v `pwd`:/tmp sqlcipher /tmp/xxx.db "x'hex-string-in-here'" decrypt.db
```

ref: https://www.zetetic.net/sqlcipher/sqlcipher-api/#example-3-convert-from-a-3-x-to-4-x-database

