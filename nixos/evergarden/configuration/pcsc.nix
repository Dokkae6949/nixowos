{ pkgs
, ...
}:

{
  services.pcscd = {
    enable = true;
    readerConfig = ''
      # Just an empty config
    '';
    plugins = [ pkgs.ccid ];
  };

  environment.systemPackages = with pkgs; [
    pcsclite
    pcsc-tools
  ];
} 
