{ lib
, pkgs
, python3Packages
, fetchFromGitHub
, cmake
, vulkan-loader
}:

python3Packages.buildPythonPackage rec {
  pname = "waifu2x-vulkan";
  version = "1.1.6";

  src = fetchFromGitHub {
    owner = "tonquer";
    repo = "waifu2x-vulkan";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-6PHVXM/2A5TMeNTsAVz26gL1IIsNNFv5VDAg8MLEBrk=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    pkgs.zlib
    vulkan-loader
  ];

  dontUseCmakeConfigure = true;

  preConfigure = ''
    export LD_LIBRARY_PATH=${vulkan-loader}/lib:$LD_LIBRARY_PATH
  '';

  meta = with lib; {
    description = "waifu2x-ncnn-vulkan-python, use nihui/waifu2x-ncnn-vulkan";
    homepage = "https://github.com/tonquer/waifu2x-vulkan";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
