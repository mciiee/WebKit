{
  description = "Webkit build flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.${system}.default =
            pkgs.mkShell {
              buildInputs = with pkgs; [
                isocodes
                cairo
                curl
                icu    	
                libjpeg
                libxml2
                openssl
                libpng
                sqlite
                zlib
                libpsl
                zlib
                lcms
                openjpeg
                woff2
                libwebp
                libxslt 
	      ];
              nativeBuildInputs = with pkgs; [
                # building
                meson
                ninja
                gnumake
                cmake
                pkg-config

                #compiler
                gcc
                perl
                ruby
                python39
                #libraries
             ];
              shellHook =
                'echo "Done flaking, starting to build" && Tools/Scripts/build-webkit --wincairo';
            };
        };
}

