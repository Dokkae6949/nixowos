{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.browser
  ];

  uwu = {
    browser = {
      zen.enable = true;
    };
  };
}
