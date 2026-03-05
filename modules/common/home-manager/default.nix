{ inputs, ... }:

{
  imports = [
    inputs.walker.homeManagerModules.default
    inputs.gazelle.homeModules.gazelle
  ];
}
