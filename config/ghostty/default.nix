{ colors, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    themes = {
      custom = {
        background = colors.background;
        cursor-color = colors.text;
        foreground = colors.text;
        palette = [
          "0=${colors.background}"
          "1=${colors.danger}"
          "2=${colors.success}"
          "3=${colors.primary}"
          "4=${colors.secondary}"
          "5=${colors.tertiary}"
          "6=${colors.warning}"
          "7=${colors.text}"
          "8=${colors.background-darker}"
          "9=${colors.danger-muted}"
          "10=${colors.success-muted}"
          "11=${colors.primary-muted}"
          "12=${colors.secondary-muted}"
          "13=${colors.tertiary-muted}"
          "14=${colors.warning-muted}"
          "15=${colors.text-muted}"
        ];
        selection-background = "353749";
        selection-foreground = "cdd6f4";
      };
    };
    settings = {
      gtk-adwaita = false;
      window-decoration = "server";
      theme = "custom";
    };
  };
}
