{...}: {
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "bottom";
      font = "monospace";
      horizontal = true;
      font-size = 9;
      padding-top = 4;
      prompt-text = "run: ";
      outline-width = 0;
      border-width = 0;
      result-spacing = 14;
      width = "100%";
      height = 25;
      background-color = "#000000ff";
      text-color = "#a0a0a0";
      selection-color = "#ffffff";
    };
  };
}
