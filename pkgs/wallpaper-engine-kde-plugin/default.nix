{ lib
, fetchFromGitHub
, extra-cmake-modules
, kdePackages
, gst_all_1
, shaderc
, mpv
, vulkan-headers
, vulkan-loader
, vulkan-tools
, pkg-config
, lz4
, python3
, qt6
}:

kdePackages.mkKdeDerivation rec {
  pname = "wallpaper-engine-kde-plugin";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "catsout";
    repo = pname;
    rev = "96230de92f1715d3ccc5b9d50906e6a73812a00a";
    fetchSubmodules = true;
    sha256 = "sha256-vkWEGlDQpfJ3fAimJHZs+aX6dh/fLHSRy2tLEsgu/JU=";
  };

  extraNativeBuildInputs = [ extra-cmake-modules pkg-config gst_all_1.gst-libav shaderc ];
  extraBuildInputs = [
    mpv lz4 vulkan-headers vulkan-tools vulkan-loader qt6.full
  ] 
  ++ (with kdePackages; [ plasma-desktop qtwebsockets qtwebchannel qtdeclarative plasma5support ])
  ++ [ (python3.withPackages (python-pkgs: [ python-pkgs.websockets ])) ];

  extraCmakeFlags = [ "-DUSE_PLASMAPKG=ON" ];

  meta = with lib; {
    description = "A kde wallpaper plugin integrating wallpaper engine";
    homepage = "https://github.com/catsout/wallpaper-engine-kde-plugin";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}

