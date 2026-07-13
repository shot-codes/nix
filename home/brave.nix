{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # vimium
    ];
    commandLineArgs = [
      "--enable-features=BraveSidebarUI"
    ];
  };
}
