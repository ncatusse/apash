
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.containsOnly

Checks if the CharSequence contains only certain characters.

## Overview

Checks if the CharSequence contains only certain characters.
An empty input string returns always true.
An empty sequence of character to search with a non empty input 
string returns false.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.containsOnly](#stringutilscontainsonly)

### StringUtils.containsOnly

#### Example

```bash
   StringUtils.constainsOnly ""     ""     # true
   StringUtils.constainsOnly ""     "ab"   # true
   StringUtils.constainsOnly "ab"   ""     # false
   StringUtils.constainsOnly "abab" "abc"  # true
   StringUtils.constainsOnly "ab1"  "abc"  # false
   StringUtils.constainsOnly "abz"  "abc"  # false

@arg $1 string The string to check.
@arg $2 string The sequence of characters which should compose the input string.
```

#### Exit codes

* **0**: True if the input string contains only provided characters.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>

