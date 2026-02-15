{ ... }:

{
  systemd.sleep.extraConfig = ''
    AllowSuspendThenHibernate=no
  '';
}