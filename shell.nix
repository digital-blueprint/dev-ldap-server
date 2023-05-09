{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [
      pkgs.openldap
      pkgs.python311
      pkgs.python311Packages.pip
      pkgs.python311Packages.ldaptor
    ];
}

