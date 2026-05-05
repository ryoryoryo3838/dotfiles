{
  description = "leaf - Terminal Markdown previewer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs systems
          (system: f (import nixpkgs { inherit system; }));
    in
    {
      packages = forAllSystems (pkgs: {
        leaf = pkgs.rustPlatform.buildRustPackage {
          pname = "leaf";
          version = "1.18.2";

          src = pkgs.fetchFromGitHub {
            owner = "RivoLink";
            repo = "leaf";
            rev = "1.18.2";
            hash = "sha256-2DE/QtP6PQ/mDYT5+/BQpy7e5SvLrvPvKQHDrGeJ73Q=";
          };

          cargoHash = "sha256-qx0wwkrbDSo1qekGK9Y2IU7QokgdHTR866UGJYDfSOM=";

          meta = {
            description = "Terminal Markdown previewer — GUI-like experience";
            homepage = "https://github.com/RivoLink/leaf";
            license = pkgs.lib.licenses.mit;
            mainProgram = "leaf";
          };
        };

        default = self.packages.${pkgs.system}.leaf;
      });
    };
}
