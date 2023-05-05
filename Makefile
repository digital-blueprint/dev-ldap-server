build-load-image:
	nix-build build.nix && \
    docker load < result
