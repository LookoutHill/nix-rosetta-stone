{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    cowsay
    lolcat
  ];

  system.stateVersion = "25.11";

  users.users.matt = {
    extraGroups = [ "wheel" ];
    initialPassword = "test";
    isNormalUser = true;
  };
}
