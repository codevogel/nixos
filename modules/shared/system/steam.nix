{ ... }:

{
  programs.steam = {
    enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true; # For Steam Remote Play
    dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };

  hardware.steam-hardware.enable = true;
  # Tip: For improved gaming performance, you can also enable GameMode:
  # programs.gamemode.enable = true;

  # Optional: If you encounter amdgpu issues with newer kernels (e.g., 6.10+ reported issues),
  # you might consider using the LTS kernel or a known stable version.
  # boot.kernelPackages = pkgs.linuxPackages_lts; # Example for LTS
}
