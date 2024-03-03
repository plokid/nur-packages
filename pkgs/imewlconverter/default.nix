{ stdenv, lib, fetchFromGitHub, buildDotnetModule, dotnetCorePackages }:

buildDotnetModule rec {
  name = "imewlconverter";
  version = "v3.1.0";

  src = fetchFromGitHub {
    owner = "studyzy";
    repo = "imewlconverter";
    rev = version;
    sha256="TSB0SmRoI79nlGlFm/+FQ8GymhCEkuNKX0NXHHw0u8s=";
  };

  projectFile = "src/ImeWlConverterCmd.sln";

  nugetDeps="" ;

  meta = with lib; {
    description = "”深蓝词库转换“ 一款开源免费的输入法词库转换程序 ";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
