{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    handbrake
  ];
}
