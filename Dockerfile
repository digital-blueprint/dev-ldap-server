FROM nixos/nix

RUN nix-channel --update
# RUN nix-build -A pythonFull '<nixpkgs>'
RUN nix-env -iA nixpkgs.python311 nixpkgs.python311Packages.pip nixpkgs.python311Packages.ldaptor nixpkgs.python311Packages.ldap3 nixpkgs.python311Packages.python-dotenv nixpkgs.python311Packages.twisted
WORKDIR /app
COPY server.py .

CMD [ "python", "server.py" ]
