{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.audio
  ];

  uwu = {
    audio = {
      spotify = {
        enable = true;
        spicetify.enable = true;
      };
    };
  };
}
