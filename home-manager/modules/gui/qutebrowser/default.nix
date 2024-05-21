{ lib, config, ... }:
with lib;
let
  cfg = config.custom.qutebrowser;
  scripts = "~/.config/qutebrowser/scripts";
in
{
  options.custom.qutebrowser.enable = mkEnableOption "enable qutebrowser.";
  config = mkIf cfg.enable {
    xdg.configFile."qutebrowser/scripts".source = ./scripts;
    programs.qutebrowser = {
      enable = true;
      keyBindings = {
        normal = {
          "<Space><Space>" = "cmd-set-text -s :tab-select";
          "<Space>vv" = "hint links spawn mpv {hint-url}";
          "<Space>vc" = "spawn --userscript ${scripts}/view_in_mpv";
          "<Space>dv" = "hint links spawn foot -e yt-dlp {hint-url}";
          "<Space>da" = "hint links spawn foot -e yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 {hint-url}";
          "<Space>pc" = "spawn --userscript ${scripts}/qute-pass";
          "<Space>pu" = "spawn --userscript ${scripts}/qute-pass --username-only";
          "<Space>pp" = "spawn --userscript ${scripts}/qute-pass --password-only";
          "<Space>pot" = "spawn --userscript ${scripts}/qute-pass --otp-only";
          "tcc" = "set -u *://{url:host}/* content.javascript.clipboard access";
          "<Space>gw" = ":tab-select whatsapp";
          "<Space>gd" = ":tab-select discord";
          "<Space>gy" = ":tab-select youtube";
          "<Space>gl" = ":tab-select hyperdx";
          "<Space>gk" = ":tab-select keybr";
        };
      };
      searchEngines = {
        DEFAULT = "https://www.google.com/search?q={}";
        aw = "https://wiki.archlinux.org/?search={}";
        rt = "https://www.reddit.com/r/{}";
        yt = "https://www.youtube.com/results?search_query={}";
        aur = "https://aur.archlinux.org/packages?O=0&K={}";
        # nixos
        nw = "https://wiki.nixos.org/index.php?search={}";
        hmo = "https://home-manager-options.extranix.com/?query={}&release=master";
        np = "https://search.nixos.org/packages?query={}";
      };
      settings = {
        auto_save.session = true;
        tabs.show = "switching";
      };
    };
  };

}
