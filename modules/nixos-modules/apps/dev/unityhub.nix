{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.unityhub.enable {
    environment.systemPackages = [
      (pkgs.symlinkJoin {
        name = "unityhub-nvidia-offload";
        paths = [
          (pkgs.unityhub.override {
            extraLibs = pkgs: [ pkgs.ncurses ];
          })
        ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/unityhub \
            --set __NV_PRIME_RENDER_OFFLOAD 1 \
            --set __NV_PRIME_RENDER_OFFLOAD_PROVIDER NVIDIA-G0 \
            --set __GLX_VENDOR_LIBRARY_NAME nvidia \
            --set __VK_LAYER_NV_optimus NVIDIA_only \
            --suffix LD_LIBRARY_PATH : "/usr/lib:/usr/lib64"
        '';
      })
    ];
  };
}
