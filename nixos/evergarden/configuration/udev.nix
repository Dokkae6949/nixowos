{ pkgs
, ... 
}:

{
  services.udev = {
    packages = [
      (pkgs.writeTextFile {
        name = "teensy_udev";
        destination = "/etc/udev/rules.d/00-teensy.rules";
        text = ''
          ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04*", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
          ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789a]*", ENV{MTP_NO_PROBE}="1"
          KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04*", MODE:="0666", RUN:="/bin/stty -F /dev/%k raw -echo"
          KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04*", MODE:="0666"
          SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04*", MODE:="0666"
          KERNEL=="hidraw*", ATTRS{idVendor}=="1fc9", ATTRS{idProduct}=="013*", MODE:="0666"
          SUBSYSTEMS=="usb", ATTRS{idVendor}=="1fc9", ATTRS{idProduct}=="013*", MODE:="0666"
        '';
      })
    ];

    extraRules = ''
      # This will allow my Pico 4 VR headset to work via ADB
      SUBSYSTEM=="usb", ATTR{idVendor}=="2d40", ATTR{idProduct}=="00b7", MODE="0666", GROUP="plugdev"
    '';
  };
}
