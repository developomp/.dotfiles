{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
    docker-buildx
    docker-compose
  ];

  virtualisation.docker.enable = true;
}
