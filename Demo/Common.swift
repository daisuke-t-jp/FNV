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
		print(String(format: "fnv0_32(\"Hello World!\") -> 0x08%x", FNV.fnv0_32("Hello World!")))
		print(String(format: "fnv0_64(\"Hello World!\") -> 0x016%lx", FNV.fnv0_64("Hello World!")))
		print(String(format: "fnv1_32(\"Hello World!\") -> 0x08%x", FNV.fnv1_32("Hello World!")))
		print(String(format: "fnv1_64(\"Hello World!\") -> 0x016%lx", FNV.fnv1_64("Hello World!")))
		print(String(format: "fnv1a_32(\"Hello World!\") -> 0x08%x", FNV.fnv1a_32("Hello World!")))
		print(String(format: "fnv1a_64(\"Hello World!\") -> 0x016%lx", FNV.fnv1a_64("Hello World!")))
		
		
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		print(String(format: "fnv0_32(file) -> 0x08%x", FNV.fnv0_32(data)))
		print(String(format: "fnv0_64(file) -> 0x016%lx", FNV.fnv0_64(data)))
		print(String(format: "fnv1_32(file) -> 0x08%x", FNV.fnv1_32(data)))
		print(String(format: "fnv1_64(file) -> 0x016%lx", FNV.fnv1_64(data)))
		print(String(format: "fnv1a_32(file) -> 0x08%x", FNV.fnv1a_32(data)))
		print(String(format: "fnv1a_64(file) -> 0x016%lx", FNV.fnv1a_64(data)))
	}
}
