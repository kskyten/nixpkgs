addJuliaLoadPath () {
    addToSearchPath JULIA_LOAD_PATH $1/src
}
echo "added $1/julia-packages to load path"

envHooks+=(addJuliaLoadPath)
