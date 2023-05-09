from ldap3 import Server, Connection, ALL
from dotenv import load_dotenv
import os

load_dotenv()

# Set the LDAP server connection details
server = Server('ldaps://ldap01-dev.tugraz.at', port=636, get_info=ALL)
username = 'cn=ldap_middleware_dev,o=tug'
password = os.getenv('IMPORT_LDAP_PASSWORD')

# Bind to the LDAP server
conn = Connection(server, user=username, password=password)
conn.bind()

# Search for all entries
search_base = 'o=tug'
search_filter = '(objectClass=*)'
attributes = ['*']
conn.search(search_base, search_filter, attributes=attributes)

# Export the entries to an LDIF file
with open('tug.ldif', 'w', encoding='utf-8') as ldif_file:
    for entry in conn.entries:
        ldif_file.write(entry.entry_to_ldif())

# Unbind from the LDAP server
conn.unbind()