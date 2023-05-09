# Dev LDAP Server

[GitHub](https://github.com/digital-blueprint/dev-ldap-server) |
[Ldaptor Quickstart](https://ldaptor.readthedocs.io/en/latest/quickstart.html)

```bash
# Install dependencies (or use direnv)
nix-shell

# Start the LDAP server
python3 server.py

# Query server with ldapsearch
ldapsearch -x -H ldap://localhost:8080 -bcn=bob,ou=people,dc=example,dc=org cn=bob
ldapsearch -x -H ldap://localhost:8080 -bcn=pbeke,ou=angehoerige,o=tug cn=pbeke

# Query server with python
python3 client.py 

# Import ldif file
python3 import-from-dev.py
```

## Docker

```bash
docker compose up

# Query server with ldapsearch
ldapsearch -x -H ldap://localhost:1389 -bcn=bob,ou=people,dc=example,dc=org cn=bob
```

## Build docker image (nix, experimental)

```bash
nix-build build.nix
docker load < result
docker run -t python-docker:latest
```
