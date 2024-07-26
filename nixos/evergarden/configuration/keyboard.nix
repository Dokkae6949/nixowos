{ ... }:

{
  console.useXkbConfig = true;

  services = {
    xserver = {
      xkb = {
        layout = "at,dh";
        options = "terminate:ctrl_alt_bksp";
        extraLayouts = {
          dh = {
            description = "Colemak-DH ergo";
            languages = ["eng"];
            symbolsFile = ./keyboard_layouts/colemak_dh;
	       };
        };
      };
    };
  };
}
