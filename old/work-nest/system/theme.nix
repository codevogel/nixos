{ lib, ... }:

{
  stylix = {
    fonts = {
      sizes.applications = lib.mkForce 12;
    };
  };
}
