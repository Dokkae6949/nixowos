# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  audio = import ./audio;
  communication = import ./communication;
  hacking = import ./hacking;
  editor = import ./editor;
  browser = import ./browser;
  gamedev = import ./gamedev;
}
