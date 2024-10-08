
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.startsWith

Check if a CharSequence starts with a specified prefix.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

Method description #########################################################

## Index

* [StringUtils.startsWith](#stringutilsstartswith)

### StringUtils.startsWith

#### Example

```bash
StringUtils.startsWith "" ""         # true
StringUtils.startsWith "abcd" ""     # true
StringUtils.startsWith "abcd" "ab"   # true
StringUtils.startsWith "abcd" "abd"  # false
StringUtils.startsWith ""     "a"    # false
```

#### Arguments

* **$1** (string): Input string to check
* **$2** (the): prefix to find

#### Exit codes

* **0**: If the string starts with the prefix
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>

