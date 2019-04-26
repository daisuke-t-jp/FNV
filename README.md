<img src="https://raw.githubusercontent.com/daisuke-t-jp/FNV/master/images/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20Linux-blue.svg)
[![Language Swift%204.2,%205.0](https://img.shields.io/badge/Language-Swift%204.2,%205.0-orange.svg)](https://developer.apple.com/swift)
[![CocoaPods](https://img.shields.io/cocoapods/v/FNV.svg)](https://cocoapods.org/pods/FNV)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-green.svg)](https://github.com/apple/swift-package-manager)
[![Build Status](https://travis-ci.org/daisuke-t-jp/FNV.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/FNV)


# Introduction

[**FNV**](http://www.isthe.com/chongo/tech/comp/fnv/index.html) (Fowler/Noll/Vo) hash framework in Swift.  
A framework includes FNV-0(32/64bit), FNV-1(32/64bit), FNV-1a(32/64bit) functions.  
  
Original FNV algorithm created by Glenn Fowler, Landon Curt Noll, and Kiem-Phong Vo.  
  
[Documentation](https://daisuke-t-jp.github.io/FNV/index.html)


# Requirements
- Platforms
  - iOS 10.0+
  - macOS 10.12+
  - tvOS 12.0+
  - Linux
- Swift 4.2, 5.0

# Installation
## CocoaPods
```
use_frameworks!

target 'target' do
pod 'FNV'
end
```

## Carthage
`github "daisuke-t-jp/FNV"`

## Swift Package Manager
```swift
import PackageDescription

let package = Package(
  name: "YOUR_PACKAGE_NAME",
  targets: [],
  dependencies: [
    // Swift 4.2
    .package(url: "https://github.com/daisuke-t-jp/FNV.git", .exact("1.0.11"))
    
    // Swift 5.0
    .package(url: "https://github.com/daisuke-t-jp/FNV.git", from: "1.0.12")
  ]
  targets: [
    .target(
    name: "YOUR_TARGET_NAME",
    dependencies: ["FNV"]),
  ]
)
```


# Usage

## Import framework
``` swift
import FNV
```

## Generate digest(One-shot)

### FNV-0
``` swift
/**
 * 32 bit
 */
let digest = FNV.FNV0_32.digest("Hello World!")
// digest -> 0x6990d79d

let digestHex = FNV.FNV0_32.digestHex("Hello World!")
// digestHex -> "6990d79d"


/**
 * 64bit
 */
let digest = FNV.FNV0_64.digest("Hello World!")
// digest -> 0xdd8b4a711cd6199d

let digestHex = FNV.FNV0_64.digestHex("Hello World!")
// digestHex -> "dd8b4a711cd6199d"
```

## FNV-1
``` swift
/**
 * 32 bit
 */
let digest = FNV.FNV1_32.digest("Hello World!")
// digest -> 0x12a9a41c

let digestHex = FNV.FNV1_32.digestHex("Hello World!")
// digestHex -> "12a9a41c"


/**
 * 64bit
 */
let digest = FNV.FNV1_64.digest("Hello World!")
// digest -> 0x8e59dd02f68c387c

let digestHex = FNV.FNV1_64.digestHex("Hello World!")
// digestHex -> "8e59dd02f68c387c"
```

## FNV-1a
``` swift
/**
 * 32 bit
 */
let digest = FNV.FNV1a_32.digest("Hello World!")
// digest -> 0xb1ea4872

let digestHex = FNV.FNV1a_32.digestHex("Hello World!")
// digestHex -> "b1ea4872"


/**
 * 64bit
 */
let digest = FNV.FNV1a_64.digest("Hello World!")
// digest -> 0x8c0ec8d1fb9e6e32

let digestHex = FNV.FNV1a_64.digestHex("Hello World!")
// digestHex -> "8c0ec8d1fb9e6e32"
```


## Generate digest(Streaming)

### FNV-0
``` swift
/**
 * 32 bit
 */
let fnv = FNV.FNV0_32()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0x6990d79d

let digestHex = fnv.digestHex()
// digestHex -> "6990d79d"


/**
 * 64bit
 */
let fnv = FNV.FNV0_64()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0xdd8b4a711cd6199d

let digestHex = fnv.digestHex()
// digestHex -> "dd8b4a711cd6199d"
```

### FNV-1
``` swift
/**
 * 32 bit
 */
let fnv = FNV.FNV1_32()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0x12a9a41c

let digestHex = fnv.digestHex()
// digestHex -> "12a9a41c"


/**
 * 64bit
 */
let fnv = FNV.FNV1_64()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0x8e59dd02f68c387c

let digestHex = fnv.digestHex()
// digestHex -> "8e59dd02f68c387c"
```

### FNV-1a
``` swift
/**
 * 32 bit
 */
let fnv = FNV.FNV1a_32()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0xb1ea4872

let digestHex = fnv.digestHex()
// digestHex -> "b1ea4872"


/**
 * 64bit
 */
let fnv = FNV.FNV1a_64()
fnv.update("Hello ")
fnv.update("World!")

let digest = fnv.digest()
// digest -> 0x8c0ec8d1fb9e6e32

let digestHex = fnv.digestHex()
// digestHex -> "8c0ec8d1fb9e6e32"
```


# Demo

There are demos.

- [iOS](https://github.com/daisuke-t-jp/FNV/tree/master/Demo/FNVDemoiOS) 
- [macOS](https://github.com/daisuke-t-jp/FNV/tree/master/Demo/FNVDemoMacOS) 
- [tvOS](https://github.com/daisuke-t-jp/FNV/tree/master/Demo/FNVDemoTvOS) 

