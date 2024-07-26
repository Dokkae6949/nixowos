{ ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, escape)";
            esc = "capslock";
            kpenter = "enter";
          };
        };
      };
    };
  };
}
