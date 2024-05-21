{ lib, config, ... }:
with lib;
let
  cfg = config.custom.fish;
in
{
    programs.fish = {
      enable = true;
      shellAbbrs = {
        lgit = {
          position = "command";
          expansion = "lazygit";
        };
      };
      shellAliases = {
        #nixos goodies
        nxgit = "lazygit -p $HOME/flakes/system/";
        nxcfg = "$EDITOR ~/flakes/system/flake.nix --cmd 'cd %:p:h'";
        nxr = pass "sudo nixos-rebuild switch --flake ~/flakes/system#nixos";
        #----------
        tm = "zellij"; # terminal multiplexer
        cfg = "$EDITOR ~/.config/(ls ~/.config | sk)"; # edit dotfiles
        passc = "pass -c"; # pass with copy
      };
    };
}
