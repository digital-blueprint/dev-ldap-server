{ pkgs ? import ./pinned.nix { }
, pkgsLinux ? import ./pinned.nix { system = "x86_64-linux"; }
}:

pkgs.dockerTools.buildImage {
  name = "python-docker";
  tag = "latest";
  config = {
    Cmd = [ "${pkgsLinux.python3}/bin/python" "--version" ];
  };
}