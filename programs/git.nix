{ pkgs, ... }:

{ 
  programs.git = {
    enable = true;
    package = pkgs.git;
    config = {
      # user.name = "random";
      # user.email = "random@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
