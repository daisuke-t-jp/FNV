//
//  FNVTests.swift
//  FNVTests
//
//  Created by Daisuke T on 2019/02/04.
//  Copyright © 2019 FNV. All rights reserved.
//

import XCTest
@testable import FNV

class FNVTests: XCTestCase {
	
	// MARK: - Property
	static var allTests = [
		("testFNV0_overload", testFNV0_overload),
		("testFNV0_32", testFNV0_32),
		("testFNV0_32_file", testFNV0_32_file),
		("testFNV0_64", testFNV0_64),
		("testFNV0_64_file", testFNV0_64_file),
		("testFNV1_overload", testFNV1_overload),
		("testFNV1_32", testFNV1_32),
		("testFNV1_32_file", testFNV1_32_file),
		("testFNV1_64", testFNV1_64),
		("testFNV1_64_file", testFNV1_64_file),
		("testFNV1a_overload", testFNV1a_overload),
		("testFNV1a_32", testFNV1a_32),
		("testFNV1a_32_file", testFNV1a_32_file),
		("testFNV1a_64", testFNV1a_64),
		("testFNV1a_64_file", testFNV1a_64_file),
		]
	

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	
	// MARK: - FNV-0
	func testFNV0_overload() {
		XCTAssertEqual(FNV.FNV0_32.digest("Hello World!"), FNV.FNV0_32.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV0_32.digest("Hello World!"), FNV.FNV0_32.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV0_32()
			fnv.update("Hello ")
			fnv.update("World!")

			let fnv2 = FNV.FNV0_32()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))

			let fnv3 = FNV.FNV0_32()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
		
		
		XCTAssertEqual(FNV.FNV0_64.digest("Hello World!"), FNV.FNV0_64.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV0_64.digest("Hello World!"), FNV.FNV0_64.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV0_64()
			fnv.update("Hello ")
			fnv.update("World!")
			
			let fnv2 = FNV.FNV0_64()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))
			
			let fnv3 = FNV.FNV0_64()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
	}
	
	func testFNV0_32() {
		do {
			let fnv = FNV.FNV0_32()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV0_32.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV0_32.digestHex("Hello World!").lowercased(), "6990d79d")
		
		XCTAssertEqual(FNV.FNV0_32.digest("Hello World!"), 0x6990d79d)
		XCTAssertEqual(FNV.FNV0_32.digest("0123456789"), 0xbd4df361)
		XCTAssertEqual(FNV.FNV0_32.digest("01234abcde"), 0x4279cf95)
		XCTAssertEqual(FNV.FNV0_32.digest("x01x00x00xff"), 0xf62d9633)
		XCTAssertEqual(FNV.FNV0_32.digest("127.0.0.1"), 0x567f75d7)
		XCTAssertEqual(FNV.FNV0_32.digest("https://example.com/"), 0x8ecd080f)
		XCTAssertEqual(FNV.FNV0_32.digest("ことえり"), 0x6c94da22)
	}
	
	func testFNV0_32_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV0_32()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0x91dbdaab)
		#endif
	}
	
	
	func testFNV0_64() {
		do {
			let fnv = FNV.FNV0_64()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV0_64.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV0_64.digestHex("Hello World!").lowercased(), "dd8b4a711cd6199d")
		
		XCTAssertEqual(FNV.FNV0_64.digest("Hello World!"), 0xdd8b4a711cd6199d)
		XCTAssertEqual(FNV.FNV0_64.digest("0123456789"), 0xea65d9a60e6e2be1)
		XCTAssertEqual(FNV.FNV0_64.digest("01234abcde"), 0xe751ec63313f3295)
		XCTAssertEqual(FNV.FNV0_64.digest("x01x00x00xff"), 0x3e1215d570a8e453)
		XCTAssertEqual(FNV.FNV0_64.digest("127.0.0.1"), 0xf548616b8621d657)
		XCTAssertEqual(FNV.FNV0_64.digest("https://example.com/"), 0x2530e2d0ceb39aef)
		XCTAssertEqual(FNV.FNV0_64.digest("ことえり"), 0x82a79a10eae2aca2)
	}
	
	func testFNV0_64_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV0_64()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0x37acb9c58d40f10b)
		#endif
	}
	
	
	
	// MARK: - FNV-1
	func testFNV1_overload() {
		XCTAssertEqual(FNV.FNV1_32.digest("Hello World!"), FNV.FNV1_32.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV1_32.digest("Hello World!"), FNV.FNV1_32.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV1_32()
			fnv.update("Hello ")
			fnv.update("World!")
			
			let fnv2 = FNV.FNV1_32()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))
			
			let fnv3 = FNV.FNV1_32()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
		
		
		XCTAssertEqual(FNV.FNV1_64.digest("Hello World!"), FNV.FNV1_64.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV1_64.digest("Hello World!"), FNV.FNV1_64.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV1_64()
			fnv.update("Hello ")
			fnv.update("World!")
			
			let fnv2 = FNV.FNV1_64()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))
			
			let fnv3 = FNV.FNV1_64()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
	}
	
	func testFNV1_32() {
		do {
			let fnv = FNV.FNV1_32()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV1_32.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV1_32.digestHex("Hello World!").lowercased(), "12a9a41c")
		
		XCTAssertEqual(FNV.FNV1_32.digest("Hello World!"), 0x12a9a41c)
		XCTAssertEqual(FNV.FNV1_32.digest("0123456789"), 0x6792412c)
		XCTAssertEqual(FNV.FNV1_32.digest("01234abcde"), 0x3afc3ca8)
		XCTAssertEqual(FNV.FNV1_32.digest("x01x00x00xff"), 0xe4709ec6)
		XCTAssertEqual(FNV.FNV1_32.digest("127.0.0.1"), 0x0a3cffd8)
		XCTAssertEqual(FNV.FNV1_32.digest("https://example.com/"), 0x3c4effd2)
		XCTAssertEqual(FNV.FNV1_32.digest("ことえり"), 0x4cb8994f)
	}
	
	func testFNV1_32_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV1_32()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0x8dffd700)
		#endif
	}
	
	
	func testFNV1_64() {
		do {
			let fnv = FNV.FNV1_64()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV1_64.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV1_64.digestHex("Hello World!").lowercased(), "8e59dd02f68c387c")
		
		XCTAssertEqual(FNV.FNV1_64.digest("Hello World!"), 0x8e59dd02f68c387c)
		XCTAssertEqual(FNV.FNV1_64.digest("0123456789"), 0xc3f080735df30b0c)
		XCTAssertEqual(FNV.FNV1_64.digest("01234abcde"), 0x94af5b2f453b3f08)
		XCTAssertEqual(FNV.FNV1_64.digest("x01x00x00xff"), 0x3bf634fda0083d06)
		XCTAssertEqual(FNV.FNV1_64.digest("127.0.0.1"), 0x34ad3b1041204318)
		XCTAssertEqual(FNV.FNV1_64.digest("https://example.com/"), 0xc673865f8a6ec652)
		XCTAssertEqual(FNV.FNV1_64.digest("ことえり"), 0xe7ab1f2ffd06f5ef)
	}
	
	func testFNV1_64_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV1_64()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0x87a1f8da448c5f20)
		#endif
	}
	
	
	
	// MARK: - FNV-1a
	func testFNV1a_overload() {
		XCTAssertEqual(FNV.FNV1a_32.digest("Hello World!"), FNV.FNV1a_32.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV1a_32.digest("Hello World!"), FNV.FNV1a_32.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV1a_32()
			fnv.update("Hello ")
			fnv.update("World!")
			
			let fnv2 = FNV.FNV1a_32()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))
			
			let fnv3 = FNV.FNV1a_32()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
		
		
		XCTAssertEqual(FNV.FNV1a_64.digest("Hello World!"), FNV.FNV1a_64.digest(Array("Hello World!".utf8)))
		XCTAssertEqual(FNV.FNV1a_64.digest("Hello World!"), FNV.FNV1a_64.digest("Hello World!".data(using: .utf8)!))
		
		do {
			let fnv = FNV.FNV1a_64()
			fnv.update("Hello ")
			fnv.update("World!")
			
			let fnv2 = FNV.FNV1a_64()
			fnv2.update(Array("Hello ".utf8))
			fnv2.update(Array("World!".utf8))
			
			let fnv3 = FNV.FNV1a_64()
			fnv3.update("Hello ".data(using: .utf8)!)
			fnv3.update("World!".data(using: .utf8)!)
			
			XCTAssertEqual(fnv.digest(), fnv2.digest())
			XCTAssertEqual(fnv.digest(), fnv3.digest())
		}
	}
	
	func testFNV1a_32() {
		do {
			let fnv = FNV.FNV1a_32()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV1a_32.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV1a_32.digestHex("Hello World!").lowercased(), "b1ea4872")
		
		XCTAssertEqual(FNV.FNV1a_32.digest("Hello World!"), 0xb1ea4872)
		XCTAssertEqual(FNV.FNV1a_32.digest("0123456789"), 0xf9808ff2)
		XCTAssertEqual(FNV.FNV1a_32.digest("01234abcde"), 0xd80f04be)
		XCTAssertEqual(FNV.FNV1a_32.digest("x01x00x00xff"), 0x19249338)
		XCTAssertEqual(FNV.FNV1a_32.digest("127.0.0.1"), 0x08a3d11e)
		XCTAssertEqual(FNV.FNV1a_32.digest("https://example.com/"), 0xe0fbd8b4)
		XCTAssertEqual(FNV.FNV1a_32.digest("ことえり"), 0xb0ecd77f)
	}
	
	func testFNV1a_32_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV1a_32()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0xdd55ad0a)
		#endif
	}
	
	
	func testFNV1a_64() {
		do {
			let fnv = FNV.FNV1a_64()
			fnv.update("Hello ")
			fnv.update("World!")
			XCTAssertEqual(FNV.FNV1a_64.digest("Hello World!"), fnv.digest())
		}
		
		XCTAssertEqual(FNV.FNV1a_64.digestHex("Hello World!").lowercased(), "8c0ec8d1fb9e6e32")
		
		XCTAssertEqual(FNV.FNV1a_64.digest("Hello World!"), 0x8c0ec8d1fb9e6e32)
		XCTAssertEqual(FNV.FNV1a_64.digest("0123456789"), 0x50c0aafd8b4330b2)
		XCTAssertEqual(FNV.FNV1a_64.digest("01234abcde"), 0x372f27a9f4dd95fe)
		XCTAssertEqual(FNV.FNV1a_64.digest("x01x00x00xff"), 0x7c23537b3eed4ed8)
		XCTAssertEqual(FNV.FNV1a_64.digest("127.0.0.1"), 0xaabafe7104d914be)
		XCTAssertEqual(FNV.FNV1a_64.digest("https://example.com/"), 0x0c8b41cfdcb3c914)
		XCTAssertEqual(FNV.FNV1a_64.digest("ことえり"), 0x8f37c53be7b7631f)
	}
	
	func testFNV1a_64_file() {
		#if SWIFT_PACKAGE
		print("[Swift-PM]Skipped UnitTest that used resources.")
		#else
		let fnv = FNV.FNV1a_64()
		
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		let bufSize = 1024
		var index = 0
		
		repeat {
			var lastIndex = index + bufSize
			if lastIndex > data.count {
				lastIndex = index + data.count - index
			}
			
			let data2 = data[index..<lastIndex]
			fnv.update(data2)
			
			index += data2.count
			if index >= data.count {
				break
			}
		} while(true)
		
		XCTAssertEqual(fnv.digest(), 0x345ebb394e2e3b0a)
		#endif
	}
	
}
