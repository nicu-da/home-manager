{
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type file --hidden --no-ignore";
    fileWidgetCommand = "fd --type file --hidden --no-ignore";
  };
}
