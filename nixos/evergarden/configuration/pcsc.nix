{ pkgs
, ...
}:

{
  services.pcscd = {
    enable = true;
    readerConfig = ''
      # Just an empty config
    '';
  };

  environment.systemPackages = with pkgs; [
    pcsclite
    pcsc-tools
  ];
} 
