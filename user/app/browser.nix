{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
  librewolf
  tor-browser
  ];

  home.sessionVariables = {
    DEFAULT_BROWSER = "${pkgs.librewolf}/bin/librewolf";
  };

  home.file.".librewolf/librewolf.overrides.cfg".text = ''
    defaultPref("browser.download.dir","/home/nishit/downloads");
    defaultPref("browser.download.useDownloadDir","false");
    defaultPref("browser.download.always_ask_before_handling_new_types","true");
    defaultPref("services.sync.prefs.sync.browser.download.useDownloadDir","false");

    defaultPref("privacy.clearOnShutdown.history",true);
    defaultPref("privacy.clearOnShutdown.downloads",true);
    defaultPref("privacy.clearOnShutdown.cookies",true);
    defaultPref("privacy.resisttFingerprinting.letterboxing", true);
    defaultPref("browser.toolbars.bookmarks.visibility","never");
  '';
}
