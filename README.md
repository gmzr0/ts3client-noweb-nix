# TeamSpeak 3 without QtWebEngine

This flake replaces the qtwebengine dependency of the TS3 client with a stub
that does the bare minimum to keep TeamSpeak running without crashes.
Consequently the "Browse Online" in the "Addons" tab of the settings is
completely empty. Otherwise I have not found any uses of the library.

## Motivation

Nixpkgs 26.05 has fully removed the teamspeak3 package since it depends on
qtwebengine 5 which has been marked as insecure since nixpkgs 25.11. By
replacing it with a stub TeamSpeak 3 can be installed without having to compile
an outdated chromium version with numerous CVEs.

## Install in NixOS

```nix
{
  inputs = {
    ts3-noweb.url = "github:Jokler/ts3client-noweb-nix";
    # ...
  };
  outputs = {
    ts3-noweb,
    ...
  }: {
    nixosConfigurations = {
      host = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ...
          ({pkgs, ...}: {
            nixpkgs.overlays = [ ts3-noweb.overlays.default ];

            environment.systemPackages = [ pkgs.teamspeak3 ];
          })
        ];
      };
    };
  };
}
```
