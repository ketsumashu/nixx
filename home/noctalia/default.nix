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
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipPreview = true;
        enableClipboardHistory = false;
        pinnedExecs = [ ];
        position = "center";
        showCategories = false;
        sortByMostUsed = true;
        terminalCommand = "foot -e";
        useApp2Unit = false;
        viewMode = "list";
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
        backgroundOpacity = 1;
        capsuleOpacity = 1;
        density = "mini";
        exclusive = true;
        floating = false;
        marginHorizontal = 0.76;
        marginVertical = 0.85;
        monitors = [
          "DP-1"
          "DP-3"
        ];
        outerCorners = true;
        position = "left";
        showCapsule = true;
        widgets = {
          center = [
            {
              "colorizeDistroLogo" = true;
              "colorizeSystemIcon" = "tertiary";
              "customIconPath" = "";
              "enableColorization" = true;
              "icon" = "noctalia";
              "id" = "ControlCenter";
              "useDistroLogo" = true;
            }
            {
              "characterCount" = 2;
              "followFocusedScreen" = false;
              "hideUnoccupied" = false;
              "id" = "Workspace";
              "labelMode" = "index";
            }
            {
              "hideMode" = "hidden";
              "hideWhenIdle" = false;
              "id" = "MediaMini";
              "maxWidth" = 145;
              "scrollingMode" = "hover";
              "showAlbumArt" = false;
              "showArtistFirst" = true;
              "showProgressRing" = true;
              "showVisualizer" = false;
              "useFixedWidth" = false;
              "visualizerType" = "linear";
            }
            #{
            #  "colorizeIcons" = true;
            #  "hideMode" = "hidden";
            #  "id" = "Taskbar";
            #  "onlyActiveWorkspaces" = true;
            #  "onlySameOutput" = true;
            #  "showPinnedApps" = true;
            #}
          ];
          "left" = [
            {
              "colorizeIcons" = true;
              "hideMode" = "hidden";
              "id" = "ActiveWindow";
              "maxWidth" = 145;
              "scrollingMode" = "hover";
              "showIcon" = true;
              "useFixedWidth" = true;
            }
          ];
          "right" = [
            {
              "diskPath" = "/";
              "id" = "SystemMonitor";
              "showCpuTemp" = true;
              "showCpuUsage" = true;
              "showDiskUsage" = false;
              "showMemoryAsPercent" = true;
              "showMemoryUsage" = true;
              "showNetworkStats" = true;
              "usePrimaryColor" = false;
            }
            {
              "hideWhenZero" = true;
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
            }
            {
              "displayMode" = "onhover";
              "id" = "Volume";
            }
            {
              "blacklist" = [
              ];
              "colorizeIcons" = false;
              "drawerEnabled" = true;
              "id" = "Tray";
              "pinned" = [
              ];
            }
            {
              "customFont" = "";
              "formatHorizontal" = "HH:mm:ss ddd MM/dd";
              "formatVertical" = "HH mm ss - MM dd";
              "id" = "Clock";
              "useCustomFont" = false;
              "usePrimaryColor" = true;
            }
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
        matugenSchemeType = "scheme-fruit-salad";
        predefinedScheme = "Monochrome";
        schedulingMode = "off";
        useWallpaperColors = false;
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
              id = "WiFi";
            }
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
        compactLockScreen = false;
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
        name = "Tokyo";
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
      screenRecorder = {
        audioCodec = "opus";
        audioSource = "default_output";
        colorRange = "limited";
        directory = "/home/mashu/Videos";
        frameRate = 120;
        quality = "very_high";
        showCursor = true;
        videoCodec = "h264";
        videoSource = "portal";
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
        cpuCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        cpuWarningThreshold = 80;
        criticalColor = "";
        diskCriticalThreshold = 90;
        diskPollingInterval = 3000;
        diskWarningThreshold = 80;
        memCriticalThreshold = 90;
        memPollingInterval = 3000;
        memWarningThreshold = 80;
        networkPollingInterval = 3000;
        tempCriticalThreshold = 90;
        tempPollingInterval = 3000;
        tempWarningThreshold = 80;
        useCustomColors = false;
        warningColor = "";
      };
      templates = {
        alacritty = false;
        cava = false;
        code = false;
        discord = true;
        emacs = false;
        enableUserTemplates = false;
        foot = false;
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
        fontDefault = "Terminus";
        fontDefaultScale = 0.9;
        fontFixed = "Terminus";
        fontFixedScale = 0.9;
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
