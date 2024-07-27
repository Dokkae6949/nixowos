{ config
, ...
}:

{
  home = {
    sessionVariables = {
      ANDROID_SDK_ROOT = "${config.home.homeDirectory}/Android/Sdk";
      ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
    };
  };
}
