{ inputs
, config
, ...
}:

let
  secretsPath = builtins.toString inputs.secrets;
in
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
      defaultSopsFile = "${secretsPath}/hosts/${config.networking.hostName}/secrets/default.yaml";
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/${config.users.users.kurisu.name}/.config/sops/age/keys.txt";
  };
}
