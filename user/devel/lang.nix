{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #rust
    rustup
    
    # python
    python3Full
    imath
    pystring

    # cc
    gcc
    gnumake
    cmake
    autoconf
    automake
    libtool

    # android
    android-tools
    android-udev-rules
  ];
}
