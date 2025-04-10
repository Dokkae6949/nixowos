{ ...
}:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "*".setEnv = {
        TERM = "xterm-256color";
      };

      kdad = {
        hostname = "194.182.186.234";
        identitiesOnly = true;
        user = "debian";
        identityFile = "~/.ssh/kdad_team";
        localForwards = [
          { host.address = "127.0.0.1";
            host.port = 8000; bind.port = 8000; }
          { host.address = "127.0.0.1";
            host.port = 8080; bind.port = 8080; }
        ];
      };
    };
  };
}
