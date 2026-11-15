{
  config,
  lib,
  ...
}: {
  # Same look as the regular launcher (whatever theme is active), with nvidia-green accents.
  xdg.configFile."tofi/nvidia-offload".text = lib.generators.toKeyValue {} (
    config.programs.tofi.settings
    // {
      prompt-color = "#76b900";
      border-color = "#76b900";
    }
  );
}
