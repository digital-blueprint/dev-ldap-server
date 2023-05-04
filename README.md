# Dev LDAP Server

```bash
# Install dependencies (or use direnv)
nix-shell

# Start the LDAP server
python3 server.py

# Query server with ldapsearch
ldapsearch -x -H ldap://localhost:8080 -bcn=bob,ou=people,dc=example,dc=org cn=bob

# Query server with python
python3 client.py 
```
