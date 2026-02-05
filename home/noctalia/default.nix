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
      settingsVersion = 47;
      bar = {
        barType = "simple";
        position = "bottom";
        monitors = [
          "DP-1"
          "HDMI-A-1"
          "DP-3"
        ];
        density = "mini";
        showOutline = false;
        showCapsule = false;
        capsuleOpacity = 0;
        backgroundOpacity = 0;
        useSeparateOpacity = true;
        floating = false;
        marginVertical = 0;
        marginHorizontal = 13;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = false;
        hideOnOverview = false;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        widgets = {
          left = [
            {
              clockColor = "primary";
              customFont = "Cozette";
              formatHorizontal = "HH:mm:ss yyyy-MM-dd";
              formatVertical = "HH mm ss - dd MM";
              id = "Clock";
              tooltipFormat = "HH:mm ddd - MMM dd";
              useCustomFont = true;
            }
            {
              compactMode = false;
              diskPath = "/home/mashu/game";
              id = "SystemMonitor";
              showCpuFreq = false;
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskAvailable = false;
              showDiskUsage = true;
              showDiskUsageAsPercent = false;
              showGpuTemp = true;
              showLoadAverage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkStats = true;
              showSwapUsage = false;
              useMonospaceFont = true;
              usePrimaryColor = false;
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
              middleClickCommand = "pwvucontrol || pavucontrol";
            }
            {
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              blacklist = [ ];
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
              id = "Tray";
              pinned = [ ];
            }
          ];
          center = [ ];
          right = [ ];
        };
        screenOverrides = [ ];
      };
      general = {
        avatarImage = "/home/mashu/PB112024-20251111-DxO_DeepPRIME XD2s.jpg";
        dimmerOpacity = 0.31;
        showScreenCorners = true;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 0.62;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = true;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableShadows = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
      };
      ui = {
        fontDefault = "Noto Sans";
        fontFixed = "Cozette";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        panelBackgroundOpacity = 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "centered";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        networkPanelView = "wifi";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
      };
      location = {
        name = "Kashiwa";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            "id" = "calendar-month-card";
          }
          {
            enabled = true;
            "id" = "timer-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "/home/mashu/wallpaper";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        sortOrder = "name";
      };
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
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Bluetooth";
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
            id = "media-sysmon-card";
          }
        ];
      };
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
      dock = {
        enabled = false;
        position = "bottom";
        displayMode = "auto_hide";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        pinnedStatic = false;
        inactiveIndicators = false;
        deadOpacity = 0.6;
        animationSpeed = 1;
      };
      network = {
        wifiEnabled = false;
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
      };
      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        largeButtonsStyle = true;
        largeButtonsLayout = "single-row";
        showNumberLabels = true;
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
            enabled = false;
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
      };
      notifications = {
        enabled = true;
        monitors = [ ];
        location = "bottom_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium;edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = true;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
      };
      osd = {
        enabled = true;
        location = "bottom_center";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
          1
          2
        ];
        monitors = [ ];
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 30;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };
      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Osaka jade";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06=30";
        manualSunset = "18=30";
        generationMethod = "rainbow";
        monitorForColors = "";
      };
      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "kitty";
          }
          {
            enabled = true;
            id = "foot";
          }
          {
            enabled = true;
            id = "wezterm";
          }
          {
            enabled = true;
            id = "discord";
          }
          {
            enabled = true;
            id = "niri";
          }
        ];
        enableUserTheming = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
      };
      desktopWidgets = {
        enabled = false;
        gridSnap = false;
        monitorWidgets = [ ];
      };
    };

  };
}
