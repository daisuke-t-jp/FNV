<img src="https://github.com/daisuke-t-jp/FNV/blob/master/doc/header.png" width="700"></br>
------
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20Linux-blue.svg)
[![Language Swift%204.2](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)](https://developer.apple.com/swift)
[![Cocoapods](https://img.shields.io/cocoapods/v/FNV.svg)](https://cocoapods.org/pods/FNV)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-green.svg)](https://github.com/apple/swift-package-manager)
[![Build Status](https://travis-ci.org/daisuke-t-jp/FNV.svg?branch=master)](https://travis-ci.org/daisuke-t-jp/FNV)


# Introduction

**FNV** (Fowler/Noll/Vo) hash framework in Swift.  
A framework includes FNV-0(32/64bit), FNV-1(32/64bit), FNV-1a(32/64bit) functions.  
  
Original FNV algorithm created by Glenn Fowler, Landon Curt Noll, and Kiem-Phong Vo.  
  
Reference :
- [FNV Hash](http://www.isthe.com/chongo/tech/comp/fnv/index.html)


# Requirements
- Platforms
  - iOS 10.0+
  - macOS 10.12+
  - tvOS 12.0+
  - Linux
- Swift 4.2+

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
        .package(url: "https://github.com/daisuke-t-jp/FNV.git", from: "1.0.0")
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

## FNV-0
``` swift
/**
 * 32bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv0_32(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv0_32("string")

// Generate from Data.
let digest = FNV.fnv0_32("string".data(using: .utf8)!)


/**
 * 64bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv0_64(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv0_64("string")

// Generate from Data.
let digest = FNV.fnv0_64("string".data(using: .utf8)!)
```

## FNV-1
``` swift
/**
 * 32bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv1_32(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv1_32("string")

// Generate from Data.
let digest = FNV.fnv1_32("string".data(using: .utf8)!)


/**
 * 64bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv1_64(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv1_64("string")

// Generate from Data.
let digest = FNV.fnv1_64("string".data(using: .utf8)!)
```

## FNV-1a
``` swift
/**
 * 32bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv1a_32(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv1a_32("string")

// Generate from Data.
let digest = FNV.fnv1a_32("string".data(using: .utf8)!)


/**
 * 64bit digest
 */
// Generate from [UInt8].
let digest = FNV.fnv1a_64(Array("string".utf8))

// Generate from String.
let digest = FNV.fnv1a_64("string")

// Generate from Data.
let digest = FNV.fnv1a_64("string".data(using: .utf8)!)
```
