source $stdenv/setup

# postFixup() {
#     if test -e $out/nix-support/propagated-native-build-inputs; then
#         ln -s $out/nix-support/propagated-native-build-inputs $out/nix-support/propagated-user-env-packages
#     fi
# }

if test -n "$juliaPreHook"; then
    eval "$juliaPreHook"
fi

genericBuild

if test -n "$juliaPostHook"; then
    eval "$juliaPostHook"
fi
