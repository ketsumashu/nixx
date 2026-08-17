{
  stdenv,
  autoPatchelfHook,
  ai-usagebar-bin,
}:

stdenv.mkDerivation {
  pname = "ai-usagebar";
  version = "0.20.1";
  src = ai-usagebar-bin;

  dontBuild = true;
  dontConfigure = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ stdenv.cc.cc.lib ];

  installPhase = ''
    install -Dm755 ai-usagebar -t $out/bin
    install -Dm755 ai-usagebar-tui -t $out/bin
  '';
}
