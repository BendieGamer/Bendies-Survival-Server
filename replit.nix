{ pkgs }: {
    deps = [
      pkgs.postgresql
      pkgs.cloudflared
      pkgs.cloudflare-dyndns
        pkgs.bashInteractive
        pkgs.man
        pkgs.caddy
        pkgs.tmux
        pkgs.jre8
    ];
}