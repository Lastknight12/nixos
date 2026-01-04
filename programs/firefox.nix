{ ... }:

{ 
  programs.firefox.enable = true;

  environment.sessionVariables = {
    BROWSER = "firefox";
  };
}
