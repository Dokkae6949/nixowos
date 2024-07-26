{ pkgs, ... }:

{
  users.users = {
    kurisu = {
      # You can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "password";
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
