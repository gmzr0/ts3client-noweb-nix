{pkgs, ...}: rec {
  qtwebengine-stub = pkgs.callPackage ./qtwebengine-stub {};
  teamspeak3 = pkgs.callPackage ./teamspeak3 {inherit qtwebengine-stub;};
}
