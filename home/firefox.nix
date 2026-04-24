{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          vimium
          duckduckgo-privacy-essentials
        ];

        # http://kb.mozillazine.org/Category:Preferences
        settings = {
          "browser.search.defaultenginename" = "duckduckgo";
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "widget.use-xdg-desktop-portal.mime-handler" = 1;
          "browser.search.suggest.enabled" = false;
          "browser.search.suggest.enabled.private" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.showSearchSuggestionsFirst" = false;
          # "browser.sessionstore.enabled" = true;
          # "browser.sessionstore.resume_from_crash" = true;
          # "browser.sessionstore.resume_session_once" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          # "browser.tabs.drawInTitlebar" = true;
          # "svg.context-properties.content.enabled" = true;
          "general.smoothScroll" = true;
          # "uc.tweak.hide-tabs-bar" = true;
          # "uc.tweak.hide-forward-button" = true;
          # "uc.tweak.rounded-corners" = true;
          # "uc.tweak.floating-tabs" = true;
          # "layout.css.color-mix.enabled" = true;
          # "layout.css.light-dark.enabled" = true;
          # "layout.css.has-selector.enabled" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          # "media.rdd-vpx.enabled" = true;
          "browser.tabs.tabmanager.enabled" = false;
          "full-screen-api.ignore-widgets" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.openpage" = false;
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.addons" = false;
          "browser.urlbar.suggest.pocket" = false;
          "browser.urlbar.suggest.topsites" = false;
        };

        userChrome = ''
          #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
            opacity: 0;
            pointer-events: none;
          }

          .titlebar-buttonbox-container{ display:none }

          #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
              visibility: collapse !important;
          }

          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
            display: none;
          }

          #sidebar-box {
              min-width: 0px !important;
          }

          #TabsToolbar { visibility: collapse !important; }
        '';
        # userChrome = (builtins.readFile ./userChrome.css);
        # userContent = (builtins.readFile ./userContent.css);
      };
    };
  };
}
