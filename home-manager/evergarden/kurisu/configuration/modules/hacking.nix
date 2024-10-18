{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.hacking
  ];

  uwu = {
    hacking = {
      binary.enable = true;
      forensics.enable = true;
      net.enable = true;
      web.enable = true;
    };
  };
}
