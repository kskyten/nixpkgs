source $stdenv/setup

if test -n "$juliaPreHook"; then
    eval "$juliaPreHook"
fi

genericBuild

if test -n "$juliaPostHook"; then
    eval "$juliaPostHook"
fi
