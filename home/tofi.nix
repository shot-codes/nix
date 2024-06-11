{
  config,
  lib,
  ...
}: {
  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  programs.tofi = {
    enable = true;
    settings = {
      anchor = "bottom-left";
      font = "monospace";
      corner-radius = 6;
      horizontal = true;
      font-size = 10;
      padding-top = 3;
      padding-bottom = 0;
      margin-bottom = 6;
      margin-left = 185;
      prompt-text = ''"-> "'';
      outline-width = 0;
      border-width = 0;
      result-spacing = 14;
      width = 800;
      height = 26;
      background-color = "#000000ff";
      text-color = "#a0a0a0";
      selection-color = "#ffffff";
    };
  };
}
