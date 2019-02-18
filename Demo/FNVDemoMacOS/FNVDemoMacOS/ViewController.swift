//
//  ViewController.swift
//  FNVDemoMacOS
//
//  Created by Daisuke T on 2019/02/05.
//  Copyright © 2019 FNVDemoMacOS. All rights reserved.
//

import Cocoa

import FNV

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		print(String(format: "fnv0_32(\"Hello World!\") -> 0x02%x", FNV.fnv0_32("Hello World!")))
		print(String(format: "fnv0_64(\"Hello World!\") -> 0x02%lx", FNV.fnv0_64("Hello World!")))
		print(String(format: "fnv1_32(\"Hello World!\") -> 0x02%x", FNV.fnv1_32("Hello World!")))
		print(String(format: "fnv1_64(\"Hello World!\") -> 0x02%lx", FNV.fnv1_64("Hello World!")))
		print(String(format: "fnv1a_32(\"Hello World!\") -> 0x02%x", FNV.fnv1a_32("Hello World!")))
		print(String(format: "fnv1a_64(\"Hello World!\") -> 0x02%lx", FNV.fnv1a_64("Hello World!")))
		
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		print(String(format: "fnv0_32(file) -> 0x02%x", FNV.fnv0_32(data)))
		print(String(format: "fnv0_64(file) -> 0x02%lx", FNV.fnv0_64(data)))
		print(String(format: "fnv1_32(file) -> 0x02%x", FNV.fnv1_32(data)))
		print(String(format: "fnv1_64(file) -> 0x02%lx", FNV.fnv1_64(data)))
		print(String(format: "fnv1a_32(file) -> 0x02%x", FNV.fnv1a_32(data)))
		print(String(format: "fnv1a_64(file) -> 0x02%lx", FNV.fnv1a_64(data)))
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

