<img src="https://github.com/daisuke-t-jp/FNV/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%2010.0+%20%7C%20macOS%2012.0+-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Cocoapods](https://img.shields.io/cocoapods/v/FNV.svg)](https://cocoapods.org/pods/FNV)
[![Build Status](https://travis-ci.org/daisuke-t-jp/FNV.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/FNV)


# What is this?

This is **FNV** (Fowler/Noll/Vo) hash framework in Swift.  
Framework include *FNV-0 32/64bit*, *FNV-1 32/64bit*, *FNV-1a 32/64bit* functions.  
  
Reference :
- [FNV Hash](http://www.isthe.com/chongo/tech/comp/fnv/)


# Install
### Carthage
`github "daisuke-t-jp/FNV"`

### CocoaPods
```
use_frameworks!

target 'target' do
pod 'FNV'
end
```


# Usage
``` swift
import FNV



// MARK: - FNV-0
/**
 * 32bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv0_32(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv0_32("string")

// Generate from Data.
let hash = FNV.fnv0_32("string".data(using: .utf8)!)


/**
 * 64bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv0_64(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv0_64("string")

// Generate from Data.
let hash = FNV.fnv0_64("string".data(using: .utf8)!)



// MARK: - FNV-1
/**
 * 32bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv1_32(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv1_32("string")

// Generate from Data.
let hash = FNV.fnv1_32("string".data(using: .utf8)!)


/**
 * 64bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv1_64(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv1_64("string")

// Generate from Data.
let hash = FNV.fnv1_64("string".data(using: .utf8)!)
                


// MARK: - FNV-1a
/**
 * 32bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv1a_32(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv1a_32("string")

// Generate from Data.
let hash = FNV.fnv1a_32("string".data(using: .utf8)!)


/**
 * 64bit hash
 */
// Generate from [UInt8].
let hash = FNV.fnv1a_64(Array("string".utf8))

// Generate from String.
let hash = FNV.fnv1a_64("string")

// Generate from Data.
let hash = FNV.fnv1a_64("string".data(using: .utf8)!)

```
