{
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "foot -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = false;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
      };
      audio = {
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        mprisBlacklist = [
        ];
        preferredPlayer = "";
        visualizerQuality = "high";
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };
      bar = {
        barType = "simple";
        backgroundOpacity = 0;
        capsuleOpacity = 0;
        useSeparateOpacity = true;
        density = "mini";
        exclusive = true;
        floating = false;
        marginHorizontal = 13;
        marginVertical = 0;
        monitors = [
          "DP-1"
          "HDMI-A-1"
          "DP-3"
        ];
        outerCorners = false;
        position = "bottom";
        showCapsule = false;
        widgets = {
          "left" = [
            {
              "customFont" = "Cozette";
              "formatHorizontal" = "HH:mm:ss yyyy-MM-dd";
              "formatVertical" = "HH mm ss - dd MM";
              "id" = "Clock";
              "tooltipFormat" = "HH:mm ddd - MMM dd";
              "useCustomFont" = true;
              "usePrimaryColor" = true;
            }
            {
              "compactMode" = false;
              "diskPath" = "/home/mashu/game";
              "id" = "SystemMonitor";
              "showCpuFreq" = false;
              "showCpuTemp" = true;
              "showCpuUsage" = true;
              "showDiskAsFree" = true;
              "showDiskUsage" = true;
              "showGpuTemp" = true;
              "showLoadAverage" = false;
              "showMemoryAsPercent" = false;
              "showMemoryUsage" = true;
              "showNetworkStats" = true;
              "showSwapUsage" = false;
              "useMonospaceFont" = true;
              "usePrimaryColor" = false;
            }
            {
              "displayMode" = "alwaysShow";
              "id" = "Volume";
              "middleClickCommand" = "pwvucontrol || pavucontrol";
            }
            {
              "hideWhenZero" = false;
              "hideWhenZeroUnread" = false;
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
              "unreadBadgeColor" = "primary";
            }
            {
              "blacklist" = [ ];
              "colorizeIcons" = false;
              "drawerEnabled" = true;
              "hidePassive" = false;
              "id" = "Tray";
              "pinned" = [ ];
            }
          ];
          "center" = [
          ];
          "right" = [
          ];
        };
      };
      calendar = {
        cards = [
          {
            "enabled" = true;
            "id" = "calendar-header-card";
          }
          {
            "enabled" = true;
            "id" = "calendar-month-card";
          }
          {
            "enabled" = true;
            "id" = "timer-card";
          }
          {
            "enabled" = true;
            "id" = "weather-card";
          }
        ];
      };
      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = true;
        manualSunrise = "06=30";
        manualSunset = "18=30";
        predefinedScheme = "Osaka jade";
        schedulingMode = "off";
        useWallpaperColors = true;
        generationMethod = "rainbow";
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            "id" = "media-sysmon-card";
          }
        ];
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "Bluetooth";
            }
            {
              id = "ScreenRecorder";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "WallpaperSelector";
            }
          ];
        };
      };
      dock = {
        enabled = false;
      };
      general = {
        allowPanelsOnScreenWithoutBar = true;
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "/home/mashu/PB112024-20251111-DxO_DeepPRIME XD2s.jpg";
        boxRadiusRatio = 1;
        compactLockScreen = true;
        dimmerOpacity = 0.31;
        enableShadows = true;
        forceBlackScreenCorners = false;
        iRadiusRatio = 1;
        language = "";
        lockOnSuspend = true;
        radiusRatio = 1;
        scaleRatio = 1;
        screenRadiusRatio = 0.62;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        showHibernateOnLockScreen = false;
        showScreenCorners = true;
      };
      hooks = {
        enabled = false;
      };
      location = {
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        name = "Kashiwa";
        showCalendarEvents = true;
        showCalendarWeather = true;
        showWeekNumberInCalendar = false;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
        weatherShowEffects = true;
      };
      network = {
        "wifiEnabled" = false;
      };
      nightLight = {
        enabled = false;
      };
      notifications = {
        backgroundOpacity = 1;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        enabled = true;
        location = "bottom_right";
        lowUrgencyDuration = 3;
        monitors = [
        ];
        normalUrgencyDuration = 8;
        overlayLayer = true;
        respectExpireTimeout = false;
      };
      osd = {
        autoHideMs = 2000;
        backgroundOpacity = 1;
        enabled = true;
        enabledTypes = [
          0
          1
          2
        ];
        location = "bottom_center";
        monitors = [
        ];
        overlayLayer = true;
      };
      sessionMenu = {
        countdownDuration = 10000;
        enableCountdown = true;
        position = "center";
        powerOptions = [
          {
            action = "lock";
            command = "";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "suspend";
            command = "";
            countdownEnabled = false;
            enabled = false;
          }
          {
            action = "hibernate";
            command = "";
            countdownEnabled = false;
            "enabled" = false;
          }
          {
            action = "reboot";
            command = "systemctl reboot";
            countdownEnabled = true;
            enabled = true;
          }
          {
            action = "logout";
            command = "";
            countdownEnabled = false;
            enabled = true;
          }
          {
            action = "shutdown";
            command = "";
            countdownEnabled = false;
            enabled = true;
          }
        ];
        showHeader = true;
      };
      settingsVersion = 26;
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        cpuPollingInterval = 1000;
        gpuPollingInterval = 3000;
        enableDgpuMonitoring = true;
        memPollingInterval = 1000;
        diskPollingInterval = 3000;
        networkPollingInterval = 1000;
        loadAvgPollingInterval = 3000;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };
      templates = {
        alacritty = false;
        btop = true;
        cava = false;
        code = false;
        discord = true;
        emacs = false;
        enableUserTemplates = false;
        foot = true;
        fuzzel = false;
        ghostty = false;
        gtk = true;
        kcolorscheme = false;
        kitty = true;
        niri = true;
        pywalfox = false;
        qt = true;
        spicetify = false;
        telegram = false;
        vicinae = false;
        walker = false;
        wezterm = false;
      };
      ui = {
        fontDefault = "Noto Sans";
        fontDefaultScale = 1;
        fontFixed = "Cozette";
        fontFixedScale = 1;
        panelBackgroundOpacity = 1;
        panelsAttachedToBar = true;
        settingsPanelAttachToBar = false;
        tooltipsEnabled = true;
      };
      wallpaper = {
        directory = "/home/mashu/wallpaper";
        enableMultiMonitorDirectories = false;
        enabled = true;
        fillColor = "#000000";
        fillMode = "crop";
        hideWallpaperFilenames = false;
        monitorDirectories = [
        ];
        overviewEnabled = true;
        panelPosition = "follow_bar";
        randomEnabled = false;
        randomIntervalSec = 300;
        recursiveSearch = false;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
        useWallhaven = false;
        wallhavenCategories = "111";
        wallhavenOrder = "desc";
        wallhavenPurity = "100";
        wallhavenQuery = "";
        wallhavenResolutionHeight = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenSorting = "relevance";
      };
    };
  };
}
