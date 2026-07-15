{...}: {
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.age.keyFile = "/home/shot/.config/sops/age/keys.txt";

  sops.secrets."example_key" = {};
  sops.secrets."example_nest/example_nested" = {
    owner = "shot";
    mode = "0400";
  };
}
# Use elsewhere in config with:
# sops.secrets."example-key".path

