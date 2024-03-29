{
  programs.fzf = {
    enable = true;
    defaultCommand = "rg --hidden --files";
    fileWidgetCommand = "rg --hidden --files";
  };
}
