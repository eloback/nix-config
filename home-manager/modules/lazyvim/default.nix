{ pkgs, ... }:
{
  xdg.configFile = {
    "nvim/init.lua".source = ./config/init.lua;
    "nvim/lua".source = ./config/lua;
    "nvim/stylua.toml".source = ./config/stylua.toml;
    "nvim/lua".recursive = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      ripgrep # Requirement for telescope
      fd
      libgcc
    ];
  };
}
