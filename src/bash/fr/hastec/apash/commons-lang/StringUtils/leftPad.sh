#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.commons-lang.NumberUtils.isDigits

# File description ###########################################################
# @name StringUtils.leftPad
# @brief Left pad a String with a specified String.
# @description 
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# @example
#    StringUtils.leftPad ""     ""    ""      # failure - ""
#    StringUtils.leftPad ""     "3"   "z"     # "zzz"
#    StringUtils.leftPad "bat"  "3"   "yz"    # "bat"
#    StringUtils.leftPad "bat"  "5"   "yz"    # "yzbat"
#    StringUtils.leftPad "bat"  "8"   "yz"    # "yzyzybat"
#    StringUtils.leftPad "bat"  "-1"  "z"     # "bat"
#    StringUtils.leftPad "bat"  "5"   ""      # "  bat"
#
# @arg $1 string The string to pad out.
# @arg $2 string The size to pad to.
# @arg $3 string The string to pad with, empty treated as single space (default).
#
# @stdout Left padded string or original string if no padding is necessary.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 When the size is not a positive numeric or the result cannot be displayed.
StringUtils.leftPad() {
  local inString="$1"
  local inSize="$2"
  local inPadString="${3:- }"
  local leftPadString=""

  # Check if the second argument is a valid number.
  NumberUtils.isDigits "$inSize" || return "$APASH_FUNCTION_FAILURE" 
  
  # Get the number of missing characters.
  local padCount=$(("$inSize" - ${#inString}))

  # If the padding size is less than the string, then return the string itself.
  [[ $padCount -le 0 ]] && echo "$inString" && return "$APASH_FUNCTION_SUCCESS"

  # Calculate how much time the pad string can be added
  # and how much letter if some space are remaining.
  local padNbPattern=$((padCount / ${#inPadString}))
  local padNbRemaining=$((padCount % ${#inPadString}))
  
  # Concatenate x time the pad string then add remaining chars.
  leftPadString=$(printf "%${padNbPattern}s")
  leftPadString="${leftPadString// /"$inPadString"}"
  leftPadString+="${inPadString:0:$padNbRemaining}"

  echo "${leftPadString}${inString}" && return "$APASH_FUNCTION_SUCCESS"

  return "$APASH_FUNCTION_FAILURE"
}

