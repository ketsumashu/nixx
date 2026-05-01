{ stdenv, autoPatchelfHook, yaskkserv2-bin }:

stdenv.mkDerivation {
  pname = "yaskkserv2-test";
  version = "0.1.7";
  src = yaskkserv2-bin;

  dontBuild = true;
  dontConfigure = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ stdenv.cc.cc.lib ];

  installPhase = ''
    mkdir -p $out/bin
    cp yaskkserv2 $out/bin/
    chmod +x $out/bin/yaskkserv2
  '';
}
