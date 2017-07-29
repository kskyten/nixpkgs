source $stdenv/setup

# JULIA_LOAD_PATH="$JULIA_LOAD_PATH${JULIA_LOAD_PATH:+:}$out"
JULIA_LOAD_PATH="$JULIA_LOAD_PATH:$out"

installPhase() {
    mkdir -p $out
    cp -R ${src}/* $out
}

postFixup() {
    if test -e $out/nix-support/propagated-native-build-inputs; then
        ln -s $out/nix-support/propagated-native-build-inputs $out/nix-support/propagated-user-env-packages
    fi
}

if test -n "$juliaPreHook"; then
    eval "$juliaPreHook"
fi

genericBuild

if test -n "$juliaPostHook"; then
    eval "$juliaPostHook"
fi
