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

# Query server with python
python3 client.py 

# Export ldif file from ldap01-dev.tugraz.at
# This will create a new file called tug.ldif that can be mounted as a volume as /app/data.ldif
python3 export-from-dev.py
```

## Docker

### Run locally with docker compose

```bash
# Build container
docker compose build

# Start container 
docker compose up

# Query server with ldapsearch
ldapsearch -x -H ldap://localhost:1389 -bcn=bob,ou=people,dc=example,dc=org cn=bob
```

### Run just with docker

```bash
docker container run --rm ghcr.io/digital-blueprint/dev-ldap-server:latest
```

## Build docker image (nix, experimental)

```bash
nix-build build.nix
docker load < result
docker run -t python-docker:latest
```
