{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.custom.cli;
in
{
  options.custom.cli.enable = mkEnableOption "enable cli programs.";
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAbbrs = {
        lgit = "lazygit";
      };
      shellAliases = {
        #nixos goodies
        nxgit = "lazygit -p $HOME/flakes/system/";
        nxcfg = "$EDITOR ~/flakes/system/flake.nix --cmd 'cd %:p:h'";
        nxr = "sudo nixos-rebuild switch --flake ~/nix-config/#simone";
        #----------
        tm = "zellij"; # terminal multiplexer
        cfg = "$EDITOR ~/.config/(ls ~/.config | sk)"; # edit dotfiles
        passc = "pass -c"; # pass with copy
      };
    };
    home.packages = with pkgs; [
      hurl
      du-dust
    ];
    programs.git = {
      enable = true;
      userName = "eloback";
      userEmail = "eduardolloback@gmail.com";
    };
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;

        line_break.disabled = true;
      };
    };
    programs.eza = {
      enable = true;
      # enableFishIntegration = true;
    };
    programs.bat.enable = true;
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.atuin = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.password-store.enable = true;
    programs.direnv.enable = true;
    programs.lazygit.enable = true;
  };
}
