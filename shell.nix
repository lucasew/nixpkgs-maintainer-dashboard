{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = with pkgs; [
    dprint
    hugo
    ltex-ls
  ];
}
