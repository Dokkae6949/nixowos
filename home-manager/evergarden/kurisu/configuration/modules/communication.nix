{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.communication
  ];

  uwu = {
    communication = {
      vestop.enable = true;
    };
  };
}
