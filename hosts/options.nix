{ lib, config, ... }:

let
  f = config.my.features;
  mkFeat =
    {
      default ? false,
      name ? "this feature",
      description ? "Enables this feature.",
    }:
    (lib.mkEnableOption name)
    // {
      inherit default description;
    };
in
{
  options.my.features = {
    profiles = {
      desktop.enable = mkFeat { name = "Desktop profile bundle."; default = true; };
      wsl.enable = mkFeat { name = "WSL profile bundle."; default = false; };
    };

    system = {
      boot.enable = mkFeat { default = true; };
      git.enable = mkFeat { default = true; };
      locale.enable = mkFeat { default = true; };
      keymap.enable = mkFeat { default = true; };
      users.enable = mkFeat { default = true; };
      networking.enable = mkFeat { default = true; };
      sops.enable = mkFeat { default = true; };
      homeManager.enable = mkFeat { default = true; };
      neovim.enable = mkFeat { default = true; };
      stylix.enable = mkFeat { default = true; };
      nvidia.enable = mkFeat { default = false; };
      hyprland = {
        enable = mkFeat { default = f.profiles.desktop.enable; };
        waybar = {
          enable = mkFeat { default = f.system.hyprland.enable; };
          laptopModules.enable = mkFeat { default = false; };
        };
        mako.enable = mkFeat { default = f.system.hyprland.enable; };
        peck.enable = mkFeat { default = f.system.hyprland.enable; };
        walker.enable = mkFeat { default = f.system.hyprland.enable; };
      };
      greeter.enable = mkFeat { default = f.profiles.desktop.enable; };
      audio.enable = mkFeat { default = f.profiles.desktop.enable; };
      bluetooth.enable = mkFeat { default = f.profiles.desktop.enable; };
    };

    apps = {
      obsidian.enable = mkFeat { default = f.profiles.desktop.enable; };
      qbittorrent.enable = mkFeat { default = f.profiles.desktop.enable; };
      steam.enable = mkFeat { default = false; };

      fileExplorer = {
        enable = mkFeat { default = true; };
        yazi.enable = mkFeat { default = f.apps.fileExplorer.enable; };
        nautilus.enable = mkFeat {
          default = f.profiles.desktop.enable && f.apps.fileExplorer.enable;
        };
      };

      browser = {
        enable = mkFeat { default = f.profiles.desktop.enable; };
        firefox.enable = mkFeat { default = f.apps.browser.enable; };
        ungoogledChromium.enable = mkFeat { default = f.apps.browser.enable; };
      };

      gazelle.enable = mkFeat { default = f.system.networking.enable; };

      media = {
        enable = mkFeat { default = f.profiles.desktop.enable; };
        playerctl.enable = mkFeat { default = f.apps.media.enable; };
        vlc.enable = mkFeat { default = f.apps.media.enable; };
        spotify.enable = mkFeat { default = f.apps.media.enable; };
        obsStudio.enable = mkFeat { default = f.apps.media.enable; };
      };
      dev = {
        enable = mkFeat { default = true; };

        # CLI
        lazygit.enable = mkFeat { default = f.apps.dev.enable; };
        bashly.enable = mkFeat { default = f.apps.dev.enable; };
        dotnet.enable = mkFeat { default = f.apps.dev.enable; };
        nodejs.enable = mkFeat { default = f.apps.dev.enable; };
        formatters.enable = mkFeat { default = f.apps.dev.enable; };
        vhs.enable = mkFeat { default = f.apps.dev.enable; };
        pls.enable = mkFeat { default = f.apps.dev.enable; };

        # GUI
        kitty.enable = mkFeat { default = f.apps.dev.enable && f.profiles.desktop.enable; };
        blender.enable = mkFeat { default = f.apps.dev.enable && f.profiles.desktop.enable; };
        godot.enable = mkFeat { default = f.apps.dev.enable && f.profiles.desktop.enable; };
        unityhub.enable = mkFeat { default = f.apps.dev.enable && f.profiles.desktop.enable; };
        vscode.enable = mkFeat { default = f.apps.dev.enable && f.profiles.desktop.enable; };

        # Shell
        shell = {
          enable = mkFeat { default = f.apps.dev.enable; };
          tmux.enable = mkFeat { default = f.apps.dev.shell.enable; };
          zsh.enable = mkFeat { default = f.apps.dev.shell.enable; };
          ohMyPosh.enable = mkFeat { default = f.apps.dev.shell.enable; };
        };
      };
    };
  };

  config = {
    # Optional safety: don't allow both profiles at once
    assertions = [
      {
        assertion = !(f.profiles.desktop.enable && f.profiles.wsl.enable);
        message = "Enable at most one of my.features.profiles.[desktop|wsl].";
      }
      {
        assertion = !(f.apps.steam.enable && !f.profiles.desktop.enable);
        message = "my.features.system.steam requires my.features.profiles.desktop.";
      }
      {
        assertion = !(f.apps.dev.lazygit.enable && !f.system.git.enable);
        message = "my.features.apps.dev.lazygit requires my.features.system.git.";
      }
      {
        assertion = !(f.apps.gazelle.enable && !f.system.networking.enable);
        message = "my.features.apps.gazelle requires my.features.system.networking.";
      }
    ];
  };
}
