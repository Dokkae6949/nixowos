{ pkgs
, config
, ... 
}:

let
  root_password_hash = "users/${config.users.users.root.name}/password_hash";
  kurisu_password_hash = "users/${config.users.users.kurisu.name}/password_hash";
in
{
  sops.secrets.${root_password_hash}.neededForUsers = true;
  sops.secrets.${kurisu_password_hash}.neededForUsers = true;

  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = config.sops.secrets.${root_password_hash}.path;
      };
      kurisu = {
        hashedPasswordFile = config.sops.secrets.${kurisu_password_hash}.path;
        isNormalUser = true;
        openssh.authorizedKeys.keys = [];
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "plugdev"
          "adbusers"
          "wireshark"
          "keyd"
        ];
        shell = pkgs.fish;
      };
    };
  };
}
