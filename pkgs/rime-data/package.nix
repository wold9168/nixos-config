{ inputs, stdenv, librime, rime-data }:

stdenv.mkDerivation {
  pname = "rime-data";
  version = "latest";
  src = inputs.rime-config;
  nativeBuildInputs = [ librime ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    cp -r $src/* $out/share/rime-data/
    runHook postInstall
  '';
  postFixup = ''
    cd $out/share/rime-data/
    for s in *.schema.yaml; do
      rime_deployer --compile "$s" . "${rime-data}/share/rime-data/" ./build
    done
    rm -f ./build/*.txt
  '';
}
