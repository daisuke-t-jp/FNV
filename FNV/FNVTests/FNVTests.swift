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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	// MARK: - FNV-0
    func testFNV0_32() {
		let map: [String: UInt32] = [
			"Hello World!": 0x6990d79d,
			"0123456789": 0xbd4df361,
			"01234abcde": 0x4279cf95,
			"x01x00x00xff": 0xf62d9633,
			"127.0.0.1": 0x567f75d7,
			"https://example.com/": 0x8ecd080f,
			"ことえり": 0x6c94da22,
		]

		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv0_32(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv0_32(elm), val)	// String
			XCTAssertEqual(FNV.fnv0_32(elm.data(using: .utf8)!), val)	// Data
		}
	}

	func testFNV0_64() {
		let map: [String: UInt64] = [
			"Hello World!": 0xdd8b4a711cd6199d,
			"0123456789": 0xea65d9a60e6e2be1,
			"01234abcde": 0xe751ec63313f3295,
			"x01x00x00xff": 0x3e1215d570a8e453,
			"127.0.0.1": 0xf548616b8621d657,
			"https://example.com/": 0x2530e2d0ceb39aef,
			"ことえり": 0x82a79a10eae2aca2,
			]
		
		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv0_64(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv0_64(elm), val)	// String
			XCTAssertEqual(FNV.fnv0_64(elm.data(using: .utf8)!), val)	// Data
		}
	}
	
	
	
	// MARK: - FNV-1
	func testFNV1_32() {
		let map: [String: UInt32] = [
			"Hello World!": 0x12a9a41c,
			"0123456789": 0x6792412c,
			"01234abcde": 0x3afc3ca8,
			"x01x00x00xff": 0xe4709ec6,
			"127.0.0.1": 0x0a3cffd8,
			"https://example.com/": 0x3c4effd2,
			"ことえり": 0x4cb8994f,
			]

		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv1_32(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv1_32(elm), val)	// String
			XCTAssertEqual(FNV.fnv1_32(elm.data(using: .utf8)!), val)	// Data
		}
	}
	
	func testFNV1_64() {
		let map: [String: UInt64] = [
			"Hello World!": 0x8e59dd02f68c387c,
			"0123456789": 0xc3f080735df30b0c,
			"01234abcde": 0x94af5b2f453b3f08,
			"x01x00x00xff": 0x3bf634fda0083d06,
			"127.0.0.1": 0x34ad3b1041204318,
			"https://example.com/": 0xc673865f8a6ec652,
			"ことえり": 0xe7ab1f2ffd06f5ef,
			]
		
		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv1_64(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv1_64(elm), val)	// String
			XCTAssertEqual(FNV.fnv1_64(elm.data(using: .utf8)!), val)	// Data
		}
	}
	
	
	
	// MARK: - FNV-1a
	func testFNV1a_32() {
		let map: [String: UInt32] = [
			"Hello World!": 0xb1ea4872,
			"0123456789": 0xf9808ff2,
			"01234abcde": 0xd80f04be,
			"x01x00x00xff": 0x19249338,
			"127.0.0.1": 0x08a3d11e,
			"https://example.com/": 0xe0fbd8b4,
			"ことえり": 0xb0ecd77f,
			]
		
		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv1a_32(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv1a_32(elm), val)	// String
			XCTAssertEqual(FNV.fnv1a_32(elm.data(using: .utf8)!), val)	// Data
		}
	}
	
	func testFNV1a_64() {
		let map: [String: UInt64] = [
			"Hello World!": 0x8c0ec8d1fb9e6e32,
			"0123456789": 0x50c0aafd8b4330b2,
			"01234abcde": 0x372f27a9f4dd95fe,
			"x01x00x00xff": 0x7c23537b3eed4ed8,
			"127.0.0.1": 0xaabafe7104d914be,
			"https://example.com/": 0x0c8b41cfdcb3c914,
			"ことえり": 0x8f37c53be7b7631f,
			]
		
		for elm in map.keys {
			let val = map[elm]
			XCTAssertEqual(FNV.fnv1a_64(Array(elm.utf8)), val)	// [UInt8]
			XCTAssertEqual(FNV.fnv1a_64(elm), val)	// String
			XCTAssertEqual(FNV.fnv1a_64(elm.data(using: .utf8)!), val)	// Data
		}
	}
	
}
