{ ... }:

{ 
  virtualisation.docker = {
    enable = true;
  };

  users.users.last.extraGroups = [ "docker" ];
}
