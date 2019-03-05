//
//  FNV.swift
//  FNV
//
//  Created by Daisuke T on 2019/02/04.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

/// FNV class
public class FNV {
	
	// MARK: - Enum, Const
	static private let offsetBasis32: UInt32 = 2166136261
	static private let offsetBasis64: UInt64 = 14695981039346656037
	static private let prime32: UInt32 = 16777619
	static private let prime64: UInt64 = 1099511628211
	
}



// MARK: - Utility
extension FNV {
	
	static private func UInt32ToHex(_ val: UInt32) -> String {
		return String.init(format: "%08x", val)
	}
	
	static private func UInt64ToHex(_ val: UInt64) -> String {
		return String.init(format: "%016lx", val)
	}
	
}



// MARK: - Algorithm
extension FNV {
	
	static private func fnv1<T: FixedWidthInteger>(_ array: [UInt8], offsetBasis: T, prime: T) -> T {
		var hash: T = offsetBasis
		
		for elm in array {
			hash = hash &* prime
			hash = hash ^ T(elm)
		}
		
		return hash
	}
	
	static private func fnv1a<T: FixedWidthInteger>(_ array: [UInt8], offsetBasis: T, prime: T) -> T {
		var hash: T = offsetBasis
		
		for elm in array {
			hash = hash ^ T(elm)
			hash = hash &* prime
		}
		
		return hash
	}
	
}



// MARK: - FNV-0
extension FNV {
	
	/// Generate FNV-0 32bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv0_32(_ array: [UInt8]) -> UInt32 {
		return fnv1(array, offsetBasis: 0, prime: prime32)
	}
	
	/// Overload func for "fnv0_32(_ array: [UInt8])".
	static public func fnv0_32(_ string: String) -> UInt32 {
		return fnv1(Array(string.utf8), offsetBasis: 0, prime: prime32)
	}
	
	/// Overload func for "fnv0_32(_ array: [UInt8])".
	static public func fnv0_32(_ data: Data) -> UInt32 {
		return fnv1([UInt8](data), offsetBasis: 0, prime: prime32)
	}
	
	
	/// Generate FNV-0 32bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv0_32Hex(_ array: [UInt8]) -> String {
		let h = fnv0_32(array)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv0_32Hex(_ array: [UInt8])".
	static public func fnv0_32Hex(_ string: String) -> String {
		let h = fnv0_32(string)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv0_32Hex(_ array: [UInt8])".
	static public func fnv0_32Hex(_ data: Data) -> String {
		let h = fnv0_32(data)
		return UInt32ToHex(h)
	}
	
	
	/// Generate FNV-0 64bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv0_64(_ array: [UInt8]) -> UInt64 {
		return fnv1(array, offsetBasis: 0, prime: prime64)
	}
	
	/// Overload func for "fnv0_64(_ array: [UInt8])".
	static public func fnv0_64(_ string: String) -> UInt64 {
		return fnv1(Array(string.utf8), offsetBasis: 0, prime: prime64)
	}
	
	/// Overload func for "fnv0_64(_ array: [UInt8])".
	static public func fnv0_64(_ data: Data) -> UInt64 {
		return fnv1([UInt8](data), offsetBasis: 0, prime: prime64)
	}
	
	
	/// Generate FNV-0 64bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv0_64Hex(_ array: [UInt8]) -> String {
		let h = fnv0_64(array)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv0_64Hex(_ array: [UInt8])".
	static public func fnv0_64Hex(_ string: String) -> String {
		let h = fnv0_64(string)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv0_64Hex(_ array: [UInt8])".
	static public func fnv0_64Hex(_ data: Data) -> String {
		let h = fnv0_64(data)
		return UInt64ToHex(h)
	}
	
}



// MARK: - FNV-1
extension FNV {
	
	/// Generate FNV-1 32bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv1_32(_ array: [UInt8]) -> UInt32 {
		return fnv1(array, offsetBasis: offsetBasis32, prime: prime32)
	}
	
	/// Overload func for "fnv1_32(_ array: [UInt8])".
	static public func fnv1_32(_ string: String) -> UInt32 {
		return fnv1(Array(string.utf8), offsetBasis: offsetBasis32, prime: prime32)
	}
	
	/// Overload func for "fnv1_32(_ array: [UInt8])".
	static public func fnv1_32(_ data: Data) -> UInt32 {
		return fnv1([UInt8](data), offsetBasis: offsetBasis32, prime: prime32)
	}
	
	
	/// Generate FNV-1 32bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv1_32Hex(_ array: [UInt8]) -> String {
		let h = fnv1_32(array)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv1_32Hex(_ array: [UInt8])".
	static public func fnv1_32Hex(_ string: String) -> String {
		let h = fnv1_32(string)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv1_32Hex(_ array: [UInt8])".
	static public func fnv1_32Hex(_ data: Data) -> String {
		let h = fnv1_32(data)
		return UInt32ToHex(h)
	}
	
	
	/// Generate FNV-1 64bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv1_64(_ array: [UInt8]) -> UInt64 {
		return fnv1(array, offsetBasis: offsetBasis64, prime: prime64)
	}
	
	/// Overload func for "fnv1_64(_ array: [UInt8])".
	static public func fnv1_64(_ string: String) -> UInt64 {
		return fnv1(Array(string.utf8), offsetBasis: offsetBasis64, prime: prime64)
	}
	
	/// Overload func for "fnv1_64(_ array: [UInt8])".
	static public func fnv1_64(_ data: Data) -> UInt64 {
		return fnv1([UInt8](data), offsetBasis: offsetBasis64, prime: prime64)
	}
	
	
	/// Generate FNV-1 64bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv1_64Hex(_ array: [UInt8]) -> String {
		let h = fnv1_64(array)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv1_64Hex(_ array: [UInt8])".
	static public func fnv1_64Hex(_ string: String) -> String {
		let h = fnv1_64(string)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv1_64Hex(_ array: [UInt8])".
	static public func fnv1_64Hex(_ data: Data) -> String {
		let h = fnv1_64(data)
		return UInt64ToHex(h)
	}
	
}



// MARK: - FNV-1a
extension FNV {
	
	/// Generate FNV-1a 32bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv1a_32(_ string: String) -> UInt32 {
		return fnv1a(Array(string.utf8), offsetBasis: offsetBasis32, prime: prime32)
	}
	
	/// Overload func for "fnv1a_32(_ array: [UInt8])".
	static public func fnv1a_32(_ array: [UInt8]) -> UInt32 {
		return fnv1a(array, offsetBasis: offsetBasis32, prime: prime32)
	}
	
	/// Overload func for "fnv1a_32(_ array: [UInt8])".
	static public func fnv1a_32(_ data: Data) -> UInt32 {
		return fnv1a([UInt8](data), offsetBasis: offsetBasis32, prime: prime32)
	}
	
	
	/// Generate FNV-1a 32bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv1a_32Hex(_ array: [UInt8]) -> String {
		let h = fnv1a_32(array)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv1a_32Hex(_ array: [UInt8])".
	static public func fnv1a_32Hex(_ string: String) -> String {
		let h = fnv1a_32(string)
		return UInt32ToHex(h)
	}
	
	/// Overload func for "fnv1_32Hex(_ array: [UInt8])".
	static public func fnv1a_32Hex(_ data: Data) -> String {
		let h = fnv1a_32(data)
		return UInt32ToHex(h)
	}
	
	
	/// Generate FNV-1a 64bit digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func fnv1a_64(_ string: String) -> UInt64 {
		return fnv1a(Array(string.utf8), offsetBasis: offsetBasis64, prime: prime64)
	}
	
	/// Overload func for "fnv1a_64(_ array: [UInt8])".
	static public func fnv1a_64(_ array: [UInt8]) -> UInt64 {
		return fnv1a(array, offsetBasis: offsetBasis64, prime: prime64)
	}
	
	/// Overload func for "fnv1a_64(_ array: [UInt8])".
	static public func fnv1a_64(_ data: Data) -> UInt64 {
		return fnv1a([UInt8](data), offsetBasis: offsetBasis64, prime: prime64)
	}
	
	
	/// Generate FNV-1a 64bit digest's hex string
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func fnv1a_64Hex(_ array: [UInt8]) -> String {
		let h = fnv1a_64(array)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv1a_64Hex(_ array: [UInt8])".
	static public func fnv1a_64Hex(_ string: String) -> String {
		let h = fnv1a_64(string)
		return UInt64ToHex(h)
	}
	
	/// Overload func for "fnv1_64Hex(_ array: [UInt8])".
	static public func fnv1a_64Hex(_ data: Data) -> String {
		let h = fnv1a_64(data)
		return UInt64ToHex(h)
	}
	
}

