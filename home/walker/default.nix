{ inputs, ... }:
{
  imports = [ inputs.walker.homeManagerModules.default ];

  programs.walker = {
    enable = true;
    runAsService = true; # Note: this option isn't supported in the NixOS module only in the home-manager module

    # All options from the config.toml can be used here https://github.com/abenz1267/walker/blob/master/resources/config.toml
    #config = {
    #  theme = "your theme name";
    #  placeholders."default" = {
    #    input = "Search";
    #    list = "Example";
    #  };
    #  providers.prefixes = [
    #    {
    #      provider = "websearch";
    #      prefix = "+";
    #    }
    #    {
    #      provider = "providerlist";
    #      prefix = "_";
    #    }
    #  ];
    #  keybinds.quick_activate = [
    #    "F1"
    #    "F2"
    #    "F3"
    #  ];
    #};

    ## Set `programs.walker.config.theme="your theme name"` to choose the default theme
    #themes = {
    #  "your theme name" = {
    #    # Check out the default css theme as an example https://github.com/abenz1267/walker/blob/master/resources/themes/default/style.css
    #    style = " /* css */ ";

    #    # Check out the default layouts for examples https://github.com/abenz1267/walker/tree/master/resources/themes/default
    #    layouts = {
    #      "layout" = " <!-- xml --> ";
    #      "item_calc" = " <!-- xml --> ";
    #      # other provider layouts
    #    };
    #  };
    #  "other theme name" = {
    #    # ...
    #  };
    #  # more themes
    #  };
  };
}
