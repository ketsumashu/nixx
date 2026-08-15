let
  action = name: args: {
    ${name} = if args == [ ] then { } else args;
  };

  block = name: args: props: children: {
    ${name} = {
      _args = args;
      _props = props;
      _children = children;
    };
  };

  bind = keys: actions: block "bind" keys { } actions;
in
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "noctalia";
    };
    settings._children = [
      (block "keybinds" [ ] { "clear-defaults" = true; } [
        (block "locked" [ ] { } [
          (bind
            [ "Ctrl g" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "pane" [ ] { } [
          (bind
            [ "left" ]
            [
              (action "MoveFocus" [ "left" ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "MoveFocus" [ "down" ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "MoveFocus" [ "up" ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "MoveFocus" [ "right" ])
            ]
          )
          (bind
            [ "c" ]
            [
              (action "SwitchToMode" [ "renamepane" ])
              (action "PaneNameInput" [ 0 ])
            ]
          )
          (bind
            [ "d" ]
            [
              (action "NewPane" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "e" ]
            [
              (action "TogglePaneEmbedOrFloating" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "f" ]
            [
              (action "ToggleFocusFullscreen" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "MoveFocus" [ "left" ])
            ]
          )
          (bind
            [ "i" ]
            [
              (action "TogglePanePinned" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "MoveFocus" [ "down" ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "MoveFocus" [ "up" ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "MoveFocus" [ "right" ])
            ]
          )
          (bind
            [ "n" ]
            [
              (action "NewPane" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "p" ]
            [
              (action "SwitchFocus" [ ])
            ]
          )
          (bind
            [ "Ctrl p" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "r" ]
            [
              (action "NewPane" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "s" ]
            [
              (action "NewPane" [ "stacked" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "w" ]
            [
              (action "ToggleFloatingPanes" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "z" ]
            [
              (action "TogglePaneFrames" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "tab" [ ] { } [
          (bind
            [ "left" ]
            [
              (action "GoToPreviousTab" [ ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "GoToNextTab" [ ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "GoToPreviousTab" [ ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "GoToNextTab" [ ])
            ]
          )
          (bind
            [ "1" ]
            [
              (action "GoToTab" [ 1 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "2" ]
            [
              (action "GoToTab" [ 2 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "3" ]
            [
              (action "GoToTab" [ 3 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "4" ]
            [
              (action "GoToTab" [ 4 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "5" ]
            [
              (action "GoToTab" [ 5 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "6" ]
            [
              (action "GoToTab" [ 6 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "7" ]
            [
              (action "GoToTab" [ 7 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "8" ]
            [
              (action "GoToTab" [ 8 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "9" ]
            [
              (action "GoToTab" [ 9 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "[" ]
            [
              (action "BreakPaneLeft" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "]" ]
            [
              (action "BreakPaneRight" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "b" ]
            [
              (action "BreakPane" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "GoToPreviousTab" [ ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "GoToNextTab" [ ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "GoToPreviousTab" [ ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "GoToNextTab" [ ])
            ]
          )
          (bind
            [ "n" ]
            [
              (action "NewTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "r" ]
            [
              (action "SwitchToMode" [ "renametab" ])
              (action "TabNameInput" [ 0 ])
            ]
          )
          (bind
            [ "s" ]
            [
              (action "ToggleActiveSyncTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Ctrl t" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "x" ]
            [
              (action "CloseTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "tab" ]
            [
              (action "ToggleTab" [ ])
            ]
          )
        ])
        (block "resize" [ ] { } [
          (bind
            [ "left" ]
            [
              (action "Resize" [ "Increase left" ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "Resize" [ "Increase down" ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "Resize" [ "Increase up" ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "Resize" [ "Increase right" ])
            ]
          )
          (bind
            [ "+" ]
            [
              (action "Resize" [ "Increase" ])
            ]
          )
          (bind
            [ "-" ]
            [
              (action "Resize" [ "Decrease" ])
            ]
          )
          (bind
            [ "=" ]
            [
              (action "Resize" [ "Increase" ])
            ]
          )
          (bind
            [ "H" ]
            [
              (action "Resize" [ "Decrease left" ])
            ]
          )
          (bind
            [ "J" ]
            [
              (action "Resize" [ "Decrease down" ])
            ]
          )
          (bind
            [ "K" ]
            [
              (action "Resize" [ "Decrease up" ])
            ]
          )
          (bind
            [ "L" ]
            [
              (action "Resize" [ "Decrease right" ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "Resize" [ "Increase left" ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "Resize" [ "Increase down" ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "Resize" [ "Increase up" ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "Resize" [ "Increase right" ])
            ]
          )
          (bind
            [ "Ctrl n" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "move" [ ] { } [
          (bind
            [ "left" ]
            [
              (action "MovePane" [ "left" ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "MovePane" [ "down" ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "MovePane" [ "up" ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "MovePane" [ "right" ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "MovePane" [ "left" ])
            ]
          )
          (bind
            [ "Ctrl h" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "MovePane" [ "down" ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "MovePane" [ "up" ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "MovePane" [ "right" ])
            ]
          )
          (bind
            [ "n" ]
            [
              (action "MovePane" [ ])
            ]
          )
          (bind
            [ "p" ]
            [
              (action "MovePaneBackwards" [ ])
            ]
          )
          (bind
            [ "tab" ]
            [
              (action "MovePane" [ ])
            ]
          )
        ])
        (block "scroll" [ ] { } [
          (bind
            [ "Alt left" ]
            [
              (action "MoveFocusOrTab" [ "left" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt down" ]
            [
              (action "MoveFocus" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt up" ]
            [
              (action "MoveFocus" [ "up" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt right" ]
            [
              (action "MoveFocusOrTab" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "e" ]
            [
              (action "EditScrollback" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt h" ]
            [
              (action "MoveFocusOrTab" [ "left" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt j" ]
            [
              (action "MoveFocus" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt k" ]
            [
              (action "MoveFocus" [ "up" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Alt l" ]
            [
              (action "MoveFocusOrTab" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "s" ]
            [
              (action "SwitchToMode" [ "entersearch" ])
              (action "SearchInput" [ 0 ])
            ]
          )
        ])
        (block "search" [ ] { } [
          (bind
            [ "c" ]
            [
              (action "SearchToggleOption" [ "CaseSensitivity" ])
            ]
          )
          (bind
            [ "n" ]
            [
              (action "Search" [ "down" ])
            ]
          )
          (bind
            [ "o" ]
            [
              (action "SearchToggleOption" [ "WholeWord" ])
            ]
          )
          (bind
            [ "p" ]
            [
              (action "Search" [ "up" ])
            ]
          )
          (bind
            [ "w" ]
            [
              (action "SearchToggleOption" [ "Wrap" ])
            ]
          )
        ])
        (block "session" [ ] { } [
          (bind
            [ "a" ]
            [
              (block "LaunchOrFocusPlugin" [ "zellij:about" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "c" ]
            [
              (block "LaunchOrFocusPlugin" [ "configuration" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "l" ]
            [
              (block "LaunchOrFocusPlugin" [ "zellij:layout-manager" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "Ctrl o" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "p" ]
            [
              (block "LaunchOrFocusPlugin" [ "plugin-manager" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "s" ]
            [
              (block "LaunchOrFocusPlugin" [ "zellij:share" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "w" ]
            [
              (block "LaunchOrFocusPlugin" [ "session-manager" ] { } [
                (action "floating" [ true ])
                (action "move_to_focused_tab" [ true ])
              ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" ] { } [
          (bind
            [ "Alt +" ]
            [
              (action "Resize" [ "Increase" ])
            ]
          )
          (bind
            [ "Alt -" ]
            [
              (action "Resize" [ "Decrease" ])
            ]
          )
          (bind
            [ "Alt =" ]
            [
              (action "Resize" [ "Increase" ])
            ]
          )
          (bind
            [ "Alt [" ]
            [
              (action "PreviousSwapLayout" [ ])
            ]
          )
          (bind
            [ "Alt ]" ]
            [
              (action "NextSwapLayout" [ ])
            ]
          )
          (bind
            [ "Alt f" ]
            [
              (action "ToggleFloatingPanes" [ ])
            ]
          )
          (bind
            [ "Ctrl g" ]
            [
              (action "SwitchToMode" [ "locked" ])
            ]
          )
          (bind
            [ "Alt i" ]
            [
              (action "MoveTab" [ "left" ])
            ]
          )
          (bind
            [ "Alt n" ]
            [
              (action "NewPane" [ ])
            ]
          )
          (bind
            [ "Alt o" ]
            [
              (action "MoveTab" [ "right" ])
            ]
          )
          (bind
            [ "Alt p" ]
            [
              (action "TogglePaneInGroup" [ ])
            ]
          )
          (bind
            [ "Alt Shift p" ]
            [
              (action "ToggleGroupMarking" [ ])
            ]
          )
          (bind
            [ "Ctrl q" ]
            [
              (action "Quit" [ ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "move" ] { } [
          (bind
            [ "Ctrl h" ]
            [
              (action "SwitchToMode" [ "move" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "session" ] { } [
          (bind
            [ "Ctrl o" ]
            [
              (action "SwitchToMode" [ "session" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "scroll" ] { } [
          (bind
            [ "Alt left" ]
            [
              (action "MoveFocusOrTab" [ "left" ])
            ]
          )
          (bind
            [ "Alt down" ]
            [
              (action "MoveFocus" [ "down" ])
            ]
          )
          (bind
            [ "Alt up" ]
            [
              (action "MoveFocus" [ "up" ])
            ]
          )
          (bind
            [ "Alt right" ]
            [
              (action "MoveFocusOrTab" [ "right" ])
            ]
          )
          (bind
            [ "Alt h" ]
            [
              (action "MoveFocusOrTab" [ "left" ])
            ]
          )
          (bind
            [ "Alt j" ]
            [
              (action "MoveFocus" [ "down" ])
            ]
          )
          (bind
            [ "Alt k" ]
            [
              (action "MoveFocus" [ "up" ])
            ]
          )
          (bind
            [ "Alt l" ]
            [
              (action "MoveFocusOrTab" [ "right" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "scroll" "search" "tmux" ] { } [
          (bind
            [ "Ctrl b" ]
            [
              (action "SwitchToMode" [ "tmux" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "scroll" "search" ] { } [
          (bind
            [ "Ctrl s" ]
            [
              (action "SwitchToMode" [ "scroll" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "tab" ] { } [
          (bind
            [ "Ctrl t" ]
            [
              (action "SwitchToMode" [ "tab" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "pane" ] { } [
          (bind
            [ "Ctrl p" ]
            [
              (action "SwitchToMode" [ "pane" ])
            ]
          )
        ])
        (block "shared_except" [ "locked" "resize" ] { } [
          (bind
            [ "Ctrl n" ]
            [
              (action "SwitchToMode" [ "resize" ])
            ]
          )
        ])
        (block "shared_except" [ "normal" "locked" "entersearch" ] { } [
          (bind
            [ "enter" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "shared_except" [ "normal" "locked" "entersearch" "renametab" "renamepane" ] { } [
          (bind
            [ "esc" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "shared_among" [ "pane" "tmux" ] { } [
          (bind
            [ "x" ]
            [
              (action "CloseFocus" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "shared_among" [ "scroll" "search" ] { } [
          (bind
            [ "PageDown" ]
            [
              (action "PageScrollDown" [ ])
            ]
          )
          (bind
            [ "PageUp" ]
            [
              (action "PageScrollUp" [ ])
            ]
          )
          (bind
            [ "left" ]
            [
              (action "PageScrollUp" [ ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "ScrollDown" [ ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "ScrollUp" [ ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "PageScrollDown" [ ])
            ]
          )
          (bind
            [ "Ctrl b" ]
            [
              (action "PageScrollUp" [ ])
            ]
          )
          (bind
            [ "Ctrl c" ]
            [
              (action "ScrollToBottom" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "d" ]
            [
              (action "HalfPageScrollDown" [ ])
            ]
          )
          (bind
            [ "Ctrl f" ]
            [
              (action "PageScrollDown" [ ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "PageScrollUp" [ ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "ScrollDown" [ ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "ScrollUp" [ ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "PageScrollDown" [ ])
            ]
          )
          (bind
            [ "Ctrl s" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "u" ]
            [
              (action "HalfPageScrollUp" [ ])
            ]
          )
        ])
        (block "entersearch" [ ] { } [
          (bind
            [ "Ctrl c" ]
            [
              (action "SwitchToMode" [ "scroll" ])
            ]
          )
          (bind
            [ "esc" ]
            [
              (action "SwitchToMode" [ "scroll" ])
            ]
          )
          (bind
            [ "enter" ]
            [
              (action "SwitchToMode" [ "search" ])
            ]
          )
        ])
        (block "renametab" [ ] { } [
          (bind
            [ "esc" ]
            [
              (action "UndoRenameTab" [ ])
              (action "SwitchToMode" [ "tab" ])
            ]
          )
        ])
        (block "shared_among" [ "renametab" "renamepane" ] { } [
          (bind
            [ "Ctrl c" ]
            [
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
        (block "renamepane" [ ] { } [
          (bind
            [ "esc" ]
            [
              (action "UndoRenamePane" [ ])
              (action "SwitchToMode" [ "pane" ])
            ]
          )
        ])
        (block "shared_among" [ "session" "tmux" ] { } [
          (bind
            [ "d" ]
            [
              (action "Detach" [ ])
            ]
          )
        ])
        (block "tmux" [ ] { } [
          (bind
            [ "left" ]
            [
              (action "MoveFocus" [ "left" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "down" ]
            [
              (action "MoveFocus" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "up" ]
            [
              (action "MoveFocus" [ "up" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "right" ]
            [
              (action "MoveFocus" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "space" ]
            [
              (action "NextSwapLayout" [ ])
            ]
          )
          (bind
            [ "\"" ]
            [
              (action "NewPane" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "%" ]
            [
              (action "NewPane" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "," ]
            [
              (action "SwitchToMode" [ "renametab" ])
            ]
          )
          (bind
            [ "[" ]
            [
              (action "SwitchToMode" [ "scroll" ])
            ]
          )
          (bind
            [ "Ctrl b" ]
            [
              (action "Write" [ 2 ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "c" ]
            [
              (action "NewTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "h" ]
            [
              (action "MoveFocus" [ "left" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "j" ]
            [
              (action "MoveFocus" [ "down" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "k" ]
            [
              (action "MoveFocus" [ "up" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "l" ]
            [
              (action "MoveFocus" [ "right" ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "n" ]
            [
              (action "GoToNextTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "o" ]
            [
              (action "FocusNextPane" [ ])
            ]
          )
          (bind
            [ "p" ]
            [
              (action "GoToPreviousTab" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
          (bind
            [ "z" ]
            [
              (action "ToggleFocusFullscreen" [ ])
              (action "SwitchToMode" [ "normal" ])
            ]
          )
        ])
      ])
      (block "plugins" [ ] { } [
        (block "about" [ ] { "location" = "zellij:about"; } [

        ])
        (block "compact-bar" [ ] { "location" = "zellij:compact-bar"; } [

        ])
        (block "configuration" [ ] { "location" = "zellij:configuration"; } [

        ])
        (block "filepicker" [ ] { "location" = "zellij:strider"; } [
          (action "cwd" [ "/" ])
        ])
        (block "plugin-manager" [ ] { "location" = "zellij:plugin-manager"; } [

        ])
        (block "session-manager" [ ] { "location" = "zellij:session-manager"; } [

        ])
        (block "status-bar" [ ] { "location" = "zellij:status-bar"; } [

        ])
        (block "strider" [ ] { "location" = "zellij:strider"; } [

        ])
        (block "tab-bar" [ ] { "location" = "zellij:tab-bar"; } [

        ])
        (block "welcome-screen" [ ] { "location" = "zellij:session-manager"; } [
          (action "welcome_screen" [ true ])
        ])
      ])
      (block "load_plugins" [ ] { } [
        (action "zellij:link" [ ])
      ])
      (block "web_client" [ ] { } [
        (action "font" [ "PlemolJP35 Console HS" ])
      ])
      (action "default_mode" [ "normal" ])
      (action "default_shell" [ "fish" ])
      (action "show_startup_tips" [ false ])
    ];
  };
}
