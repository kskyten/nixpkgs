addJuliaLoadPath () {
    addToSearchPath JULIA_LOAD_PATH $1
}

envHooks+=(addJuliaLoadPath)
