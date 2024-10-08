#!/usr/bin/env bash

# <!-- @package -->
# @name apash
# @brief Translation for shell scripts of some apache libraries.
# @description
#     Provides highly reusable utility methods.
#
# ### Parents
# [Main page](../../../../README.md)
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[commons-lang](apash/commons-lang.md)|Provides highly reusable utility methods.|
# |[lang](apash/lang.md)|Provides methods that are fundamental to the design script. |
# |[util](apash/util.md)|Provides miscellaneous utility.|
# <!-- apash.summaryTableEnd -->
 

# Declaration of global variables
export APASH_FUNCTION_SUCCESS=0
export APASH_FUNCTION_FAILURE=1

apash.import(){
  local lib
  local libs=()
  local forceFlag=false
  local location=""
  local APASH_BASH_DIR="$APASH_HOME_DIR/src/bash"
  [ "$1" = "-f" ] && forceFlag=true && shift

  for l in "$@"; do
    location="$APASH_BASH_DIR/${l//./\/}"
    # Import package
    if [ -d "$location" ]; then
      location="$location/*.sh"
      for lib in $location; do
        libs+=("$lib")
      done
    
    # Import a single class or method
    elif [ -r "$location.sh" ]; then
      libs+=("$location.sh")

    # Import a file terminating by .sh
    elif [ -r "${location//\/sh/}.sh" ]; then
      libs+=("${location//\/sh/}.sh")
    
    # Check if raw value is a package
    elif [ -d "$l" ]; then
      location="$l/*.sh"
      for lib in $location; do
        libs+=("$lib")
      done
    
    # Import the raw file path
    elif [ -r "$l" ]; then
      libs+=("$l")
    
    # The library connot be imported
    else
      echo "WARNING: Unknown library: '$l' - '$location'" >&2
      continue
    fi
  done

  for lib in "${libs[@]}"; do
    [ ! -r "$lib" ] && echo "WARNING: non readable library: $lib" >&2 && continue
    if ! declare -F "$(basename "$(dirname "$lib")")" || [[ $forceFlag = true ]]; then
      # shellcheck disable=SC1090
      source "$lib"
    fi
  done
}

export -f apash.import
