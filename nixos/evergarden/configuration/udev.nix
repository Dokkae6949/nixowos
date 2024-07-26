{ ... }:

{
  services.udev = {
    extraRules = ''
      # This will allow my Pico 4 VR headset to work via ADB
      SUBSYSTEM=="usb", ATTR{idVendor}=="2d40", ATTR{idProduct}=="00b7", MODE="0666", GROUP="plugdev"
    '';
  };
}
