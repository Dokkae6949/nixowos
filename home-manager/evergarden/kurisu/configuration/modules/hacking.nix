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
      forensic.enable = true;
      net.enable = true;
      web.enable = true;
    };
  };
}
