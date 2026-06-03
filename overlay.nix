{
  withSystem,
  inputs,
  ...
}: {
  flake.overlays.default = _final: prev:
    withSystem prev.stdenv.hostPlatform.system (
      _: {
        teamspeak3 = prev.callPackage ./packages/teamspeak3 {
          inherit inputs;
        };
      }
    );
}
