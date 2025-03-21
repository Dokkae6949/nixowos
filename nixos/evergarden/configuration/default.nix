{ ... }:

{
  imports = [
    ./services

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
    ./sops.nix
    ./impermanence.nix
    ./sudo.nix

    ./hyprland.nix
    ./fish.nix
    ./mongodb.nix
    ./postgresql.nix
    # ./virtualisation.nix
    ./docker.nix
    ./steam.nix
    ./pcsc.nix
    ./nh.nix
    ./wireshark.nix
  ];
}
