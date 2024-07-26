{ ... }:

{
  imports = [
    ./boot.nix
    ./users.nix
    ./time.nix
    ./greetd.nix
    ./logind.nix
    ./security.nix
    ./networking.nix
    ./ssh.nix
    ./pipewire.nix
    ./keyd.nix
    ./printing.nix
    ./udev.nix
    ./bluetooth.nix
    ./power-management.nix
    ./keyboard.nix
    ./fonts.nix
    ./i18n.nix

    ./hyprland.nix
    ./fish.nix
    ./mongodb.nix
    ./postgresql.nix
    ./virtualisation.nix
    ./steam.nix
  ];
}
