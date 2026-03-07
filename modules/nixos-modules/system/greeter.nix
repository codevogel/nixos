{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.host-options.system.desktop-environment.greeter.enable {
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
