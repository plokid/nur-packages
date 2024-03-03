{ stdenv, lib, fetchFromGitHub, buildDotnetModule, dotnetCorePackages }:

buildDotnetModule rec {
  name = "imewlconverter";
  version = "3.1.0";

  src = fetchFromGitHub {
    owner = "studyzy";
    repo = "imewlconverter";
    rev = "v$version";
    sha256="TSB0SmRoI79nlGlFm/+FQ8GymhCEkuNKX0NXHHw0u8s=";
  };

  projectFile = "src/ImeWlConverterCmd/ImeWlConverterCmd.csproj";
  
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  
  nugetDeps = ./deps.nix;

  meta = with lib; {
    description = "”深蓝词库转换“ 一款开源免费的输入法词库转换程序 ";
    homepage = "https://github.com/studyzy/imewlconverter";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
