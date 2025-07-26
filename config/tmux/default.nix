{ ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    clock24 = true;
    extraConfig = ''
      set -g mouse on
      set -g renumber-windows on
      bind f resize-pane -Z

      # Clock
      setw -g clock-mode-colour black

      # Prefix
      unbind C-b
      set-option -g prefix `
      bind-key ` send-prefix

      # Splitting
      bind h split-window -h
      bind v split-window -v
      unbind '"'
      unbind %

      # Moving across panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Panes
      set -g pane-border-style fg=black
      set -g pane-active-border-style fg=yellow
      set -g pane-border-line simple

      # Statusline
      setw -g window-status-current-format ' #W '
      setw -g window-status-format ' #W '
      setw -g window-status-style fg=black
      setw -g window-status-current-style fg=yellow
      setw -g window-status-bell-style fg=red

      set -g status-style 'fg=yellow bg=default'
      set -g status-left ""
      set -g status-right '%Y-%m-%d %H:%M'

      set -g message-style 'fg=blue bg=default'
    '';
  };
}
