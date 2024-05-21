{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.custom.gui;
in
{
  imports = [
    ./qutebrowser
  ];
  options.custom.cli.enable = mkEnableOption "enable cli programs.";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    ];
    custom.qutebrowser.enable = true;
  };
}
