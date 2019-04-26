//
//  Common.swift
//  FNVDemo
//
//  Created by Daisuke T on 2019/02/28.
//  Copyright © 2019 FNVDemo. All rights reserved.
//

import Foundation

import FNV

class Common {
  
  static func test() {
    print("fnv0_32(\"Hello World!\") -> \(FNV.FNV0_32.digestHex("Hello World!"))")
    print("fnv0_64(\"Hello World!\") -> \(FNV.FNV0_64.digestHex("Hello World!"))")
    print("fnv1_32(\"Hello World!\") -> \(FNV.FNV1_32.digestHex("Hello World!"))")
    print("fnv1_64(\"Hello World!\") -> \(FNV.FNV1_64.digestHex("Hello World!"))")
    print("fnv1a_32(\"Hello World!\") -> \(FNV.FNV1a_32.digestHex("Hello World!"))")
    print("fnv1a_64(\"Hello World!\") -> \(FNV.FNV1a_64.digestHex("Hello World!"))")
    
    
    let bundle = Bundle(for: Common.self)
    let path = bundle.path(forResource: "alice29", ofType: "txt")!
    let data = NSData(contentsOfFile: path)! as Data
    
    let fnv0_32 = FNV.FNV0_32()
    let fnv0_64 = FNV.FNV0_64()
    let fnv1_32 = FNV.FNV1_32()
    let fnv1_64 = FNV.FNV1_64()
    let fnv1a_32 = FNV.FNV1a_32()
    let fnv1a_64 = FNV.FNV1a_64()
    
    let bufSize = 1024
    var index = 0
    
    repeat {
      var lastIndex = index + bufSize
      if lastIndex > data.count {
        lastIndex = index + data.count - index
      }
      
      let data2 = data[index..<lastIndex]
      fnv0_32.update(data2)
      fnv0_64.update(data2)
      fnv1_32.update(data2)
      fnv1_64.update(data2)
      fnv1a_32.update(data2)
      fnv1a_64.update(data2)
      
      index += data2.count
      if index >= data.count {
        break
      }
    } while(true)
    
    print("fnv0_32(file) -> \(fnv0_32.digestHex())")
    print("fnv0_64(file) -> \(fnv0_64.digestHex())")
    print("fnv1_32(file) -> \(fnv1_32.digestHex())")
    print("fnv1_64(file) -> \(fnv1_64.digestHex())")
    print("fnv1a_32(file) -> \(fnv1a_32.digestHex())")
    print("fnv1a_64(file) -> \(fnv1a_64.digestHex())")
  }
}
