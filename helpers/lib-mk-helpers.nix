{ lib }:

rec {
  # Creates a boolean enable option whose default is inherited from its parent's
  # evaluated enable value, so disabling a parent cascades down as the default
  # for all its children (while still allowing children to be overridden).
  mkCascadingEnable =
    default:
    lib.mkEnableOption "Enable this host-option. Also acts as the default for any direct child."
    // {
      inherit default;
    };

  # Recursively converts a feature tree into a NixOS options tree.
  # Each node gets an `enable` option whose default is the parent's evaluated
  # enable value (via parentCfg.enable), so overrides propagate downward.
  #
  # - parentCfg: the evaluated config of the parent node, used to seed the
  #              default for this node's children's `enable`
  # - cfgNode:   the evaluated config of the current node, used to seed the
  #              default for this node's `enable`
  # - tree:      the feature subtree to convert; leaves are either:
  #              * null / {}: produce { enable = mkCascadingEnable parentCfg.enable; }
  #              * lib.mkOption: passed through as-is (guarded by lib.isOption)
  #              * attrsets: recursed into with `enable` appended at each level
  mkOptionsTree =
    mkCascadingEnable: parentCfg: cfgNode: tree:
    lib.mapAttrs (
      name: value:
      let
        currentCfg = cfgNode.${name};
      in
      if value == null then
        { enable = mkCascadingEnable parentCfg.enable; }
      else if lib.isAttrs value && !(lib.isOption value) then
        (mkOptionsTree mkCascadingEnable currentCfg currentCfg value)
        // {
          enable = mkCascadingEnable parentCfg.enable;
        }
      else
        value
    ) tree;
}
