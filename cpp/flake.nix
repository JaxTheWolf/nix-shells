{
  description = "Central C++ Dev Shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          gcc
          cmake
          ninja
          gdb
          pkg-config
          valgrind
          bind
        ];

        buildInputs = with pkgs; [
        ];
        shellHook = ''
          export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
        '';
      };
    };
}
