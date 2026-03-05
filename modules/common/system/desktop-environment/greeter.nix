{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    host-options.desktop-environment.greeter.enable = lib.mkEnableOption "Enable greeter" // {
      default = config.host-options.desktop-environment.enable;
    };
  };

  config = lib.mkIf config.host-options.desktop-environment.greeter.enable {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          user = "greeter";
          command = ''
            ${pkgs.tuigreet}/bin/tuigreet \
              --time \
              --remember \
              --remember-user-session \
              --asterisks \
              --cmd start-hyprland
          '';
        };
      };
    };

    environment.systemPackages = with pkgs; [
      tuigreet
    ];
  };
}
