# FNV
FNV Hash Algorithm by Swift.

![Platform](https://img.shields.io/badge/Platform-iOS%2010.0+-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Cocoapods](https://img.shields.io/cocoapods/v/FNV.svg)](https://cocoapods.org/pods/FNV)
[![Build Status](https://travis-ci.org/daisuke-t-jp/FNV.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/FNV)



# FNV Algorithm

http://www.isthe.com/chongo/tech/comp/fnv/


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

// FNV-0 32bit
FNV.fnv0_32("string")	// String
FNV.fnv0_32(Array("string".utf8)) // [UInt8]
FNV.fnv0_32("string".data(using: .utf8)!)	// Data

// FNV-0 64bit
FNV.fnv0_64("string")	// String
FNV.fnv0_64(Array("string".utf8)) // [UInt8]
FNV.fnv0_64("string".data(using: .utf8)!)	// Data

// FNV-1 32bit
FNV.fnv1_32("string")	// String
FNV.fnv1_32(Array("string".utf8)) // [UInt8]
FNV.fnv1_32("string".data(using: .utf8)!)	// Data

// FNV-1 64bit
FNV.fnv1_64("string")	// String
FNV.fnv1_64(Array("string".utf8)) // [UInt8]
FNV.fnv1_64("string".data(using: .utf8)!)	// Data
                
// FNV-1a 32bit
FNV.fnv1a_32("string")	// String
FNV.fnv1a_32(Array("string".utf8)) // [UInt8]
FNV.fnv1a_32("string".data(using: .utf8)!)	// Data

// FNV-1a 64bit
FNV.fnv1a_64("string")	// String
FNV.fnv1a_64(Array("string".utf8)) // [UInt8]
FNV.fnv1a_64("string".data(using: .utf8)!)	// Data
```



