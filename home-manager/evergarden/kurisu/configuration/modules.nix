{ outputs
, ...
}:

{
  imports = [
    outputs.homeManagerModules.audio
    outputs.homeManagerModules.browser
    outputs.homeManagerModules.communication
    outputs.homeManagerModules.editor
    outputs.homeManagerModules.hacking
    outputs.homeManagerModules.gamedev
  ];

  uwu = {
    audio = {
      spotify = {
        enable = true;
        spicetify.enable = true;
      };
    };

    browser = {
      zen.enable = true;
    };

    communication = {
      vesktop.enable = true;
    };

    editor = {
      helix.enable = true;
    };

    hacking = {
      binary.enable = true;
      forensic.enable = true;
      net.enable = true;
      web.enable = true;
    };

    gamedev = {
      godot.enable = true;
    };
  };
}
