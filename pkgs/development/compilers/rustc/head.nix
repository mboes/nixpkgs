# Please make sure to check if rustfmt still builds when updating nightly
{ stdenv, callPackage }:

callPackage ./generic.nix {
  shortVersion = "2015-10-27";
  isRelease = false;
  forceBundledLLVM = false;
  srcRev = "8ab8581f6921bc7a8e3fa4defffd2814372dcb15";
  srcSha = "06sg327y95zx7w4jxl6i34j4x2g8mhhvri8gxk4qcfmar4cg8has";

  /* Rust is bootstrapped from an earlier built version. We need
  to fetch these earlier versions, which vary per platform.
  The shapshot info you want can be found at
  https://github.com/rust-lang/rust/blob/{$shortVersion}/src/snapshots.txt
  with the set you want at the top.
  */

  snapshotHashLinux686 = "e2553bf399cd134a08ef3511a0a6ab0d7a667216";
  snapshotHashLinux64 = "7df8ba9dec63ec77b857066109d4b6250f3d222f";
  snapshotHashDarwin686 = "29750870c82a0347f8b8b735a4e2e0da26f5098d";
  snapshotHashDarwin64 = "c9f2c588238b4c6998190c3abeb33fd6164099a2";
  snapshotDate = "2015-08-11";
  snapshotRev = "1af31d4";

  patches = [ ./patches/remove-uneeded-git.patch ]
    ++ stdenv.lib.optional stdenv.needsPax ./patches/grsec-head.patch;
}

