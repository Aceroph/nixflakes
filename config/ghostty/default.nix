{ colors, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
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
          "8=${colors.background}"
          "9=${colors.danger}"
          "10=${colors.success}"
          "11=${colors.primary}"
          "12=${colors.secondary}"
          "13=${colors.tertiary}"
          "14=${colors.warning}"
          "15=${colors.text}"
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
