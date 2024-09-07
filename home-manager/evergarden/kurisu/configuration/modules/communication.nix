{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.communication
  ];

  uwu = {
    communication = {
      vesktop.enable = true;
    };
  };
}
