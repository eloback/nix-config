{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.custom.cli;
  shell = import ./fish.nix;
in
{
  options.custom.cli.enable = mkEnableOption "enable cli programs.";
  config = mkIf cfg.enable (with shell; {
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
  });
}
