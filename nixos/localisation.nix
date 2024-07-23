{ pkgs, ... }:{
  time = {
    timeZone = "Asia/Tokyo";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-skk
          fcitx5-gtk
          kdePackages.fcitx5-qt
          fcitx5-nord
        ];
        waylandFrontend = true;
      };
    };
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
}
