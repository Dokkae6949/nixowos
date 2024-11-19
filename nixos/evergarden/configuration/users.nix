{ pkgs
, config
, ... 
}:

let
  password_hash = "users/${config.users.users.kurisu.name}/password_hash";
in
{
  sops.secrets.${password_hash}.neededForUsers = true;

  users.users = {
    kurisu = {
      hashedPasswordFile = config.sops.secrets.${password_hash}.path;
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "plugdev"
        "adbusers"
        "libbirtd"
        "wireshark"
        "keyd"
      ];
      shell = pkgs.fish;
    };
  };
}
