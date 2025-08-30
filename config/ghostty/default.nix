{ colors, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    themes = {
      custom = {
        background = colors.background;
        cursor-color = colors.bright-foreground;
        foreground = colors.bright-background;
        palette = [
          "0=${colors.background}"
          "1=${colors.red}"
          "2=${colors.yellow}"
          "3=${colors.green}"
          "4=${colors.blue}"
          "5=${colors.purple}"
          "6=${colors.aqua}"
          "7=${colors.foreground}"
          "8=${colors.bright-background}"
          "9=${colors.bright-red}"
          "10=${colors.bright-yellow}"
          "11=${colors.bright-green}"
          "12=${colors.bright-blue}"
          "13=${colors.bright-purple}"
          "14=${colors.bright-aqua}"
          "15=${colors.bright-foreground}"
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
