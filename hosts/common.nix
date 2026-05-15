{ lib, config, ... }:

{

  imports = [
    ./options.nix
    ../modules/nixos-modules/default.nix
  ];

  config = {

    nix.settings.experimental-features = lib.mkDefault [
      "nix-command"
      "flakes"
    ];
    nix.settings.download-buffer-size = lib.mkDefault 134217728; # 128 MiB

    nix.gc = lib.mkIf config.my.features.system.autoGarbageCollection.enable {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = lib.mkDefault "25.11"; # Did you read the comment?

  };

}
