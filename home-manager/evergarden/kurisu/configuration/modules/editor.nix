{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.editor
  ];

  uwu = {
    editor = {
      helix.enable = true;
    };
  };
}
