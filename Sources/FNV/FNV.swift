//
//  FNV.swift
//  FNV
//
//  Created by Daisuke T on 2019/02/04.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

public class FNV {
	
	// MARK: - Enum, Const
	static private let offsetBasis32: UInt32 = 2166136261
	static private let offsetBasis64: UInt64 = 14695981039346656037
	static private let prime32: UInt32 = 16777619
	static private let prime64: UInt64 = 1099511628211
	
}



// MARK: - Algorithm
public extension FNV {
	
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
public extension FNV {
	
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
	
}



// MARK: - FNV-1
public extension FNV {
	
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
	
}



// MARK: - FNV-1a
public extension FNV {
	
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
	
}

