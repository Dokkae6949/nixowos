# This is the home of custom module configurations.
# This does not contain module definitions but just 
# enabled / configures them.

{ ...
}:

{
  imports = [
    ./audio.nix
    ./communication.nix
    ./hacking.nix
  ];
}
