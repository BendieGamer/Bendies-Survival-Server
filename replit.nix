{ pkgs }: {
    deps = [
      pkgs.perl536Packages.TextBrew
      pkgs.docker-client
      pkgs.docker
      pkgs.cloudflared
        pkgs.bashInteractive
        pkgs.man
        pkgs.caddy
        pkgs.tmux
        pkgs.jre8
    ];
}