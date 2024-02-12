{ options, config, lib, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.system.xkb;
in
{
  options.nixowos.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
    layout = mkOpt str "at" "The keyboard layout to use.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      xkb = {
        layout = cfg.layout;
        options = "caps:escape";

        extraLayouts = {
          dh = {
            description = "Colemak-DH ergo";
            languages = ["eng"];
            symbolsFile = ./layouts/colemak_dh;
	  };
	};
    };
  };
}
