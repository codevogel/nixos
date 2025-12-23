{ pkgs, ... }:

{
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
            --cmd Hyprland
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}
