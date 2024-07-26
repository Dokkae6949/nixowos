{ pkgs, ... }:

{
  security = {
    rtkit.enable = true;
    pam.services.swaylock = {};
  };
  
  services = {
    passSecretService = {
      enable = true;
      package = pkgs.libsecret;
    };

    gnome.gnome-keyring.enable = true;
  };
}
