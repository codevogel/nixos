{ ... }:

{
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."10-samplerate" = {
        context.properties = {
          default.clock.rate = 96000;
          default.clock.allowed-rates = [
            44100
            48000
            88200
            96000
          ];
        };
      };
    };
  };
}
