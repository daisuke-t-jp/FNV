//
//  FNV1_64.swift
//  FNV
//
//  Created by Daisuke T on 2019/03/06.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

extension FNV {
	
	/// FNV-1 64bit class
	public class FNV1_64 {
		
		// MARK: - Enum, Const
		private var h: UInt64 = Common.offsetBasis64
		
		
		
		// MARK: - Life cycle
		
		/// Creates a new instance with the seed.
		public init() {
			reset()
		}
	}
	
}



// MARK: - Digest(One-shot)
extension FNV.FNV1_64 {
	
	/// Generate digest.
	///
	/// - Parameter array: A source data for hash.
	/// - Returns: A generated digest.
	static public func digest(_ array: [UInt8]) -> UInt64 {
		return Common.fnv1(array, offsetBasis: Common.offsetBasis64, prime: Common.prime64)
	}
	
	/// Overload func for "digest(_ array: [UInt8])".
	static public func digest(_ string: String) -> UInt64 {
		return digest(Array(string.utf8))
	}
	
	/// Overload func for "digest(_ array: [UInt8])".
	static public func digest(_ data: Data) -> UInt64 {
		return digest([UInt8](data))
	}
	
	
	/// Generate digest's hex string.
	///
	/// - Parameters:
	///   - array: A source data for hash.
	/// - Returns: A generated digest's hex string.
	static public func digestHex(_ array: [UInt8]) -> String {
		let h = digest(array)
		return Common.UInt64ToHex(h)
	}
	
	/// Overload func for "digestHex(_ array: [UInt8])".
	static public func digestHex(_ string: String) -> String {
		let h = digest(string)
		return Common.UInt64ToHex(h)
	}
	
	/// Overload func for "digestHex(_ array: [UInt8])".
	static public func digestHex(_ data: Data) -> String {
		let h = digest(data)
		return Common.UInt64ToHex(h)
	}
	
}



// MARK: - Digest(Streaming)
extension FNV.FNV1_64 {
	
	/// Reset current streaming state to initial.
	public func reset() {
		h = Common.offsetBasis64
	}
	
	
	/// Update streaming state.
	///
	/// - Parameter array: A source data for hash.
	public func update(_ array: [UInt8]) {
		h = Common.fnv1(array, offsetBasis: h, prime: Common.prime64)
	}
	
	/// Overload func for "update(_ array: [UInt8])".
	public func update(_ string: String) {
		return update(Array(string.utf8))
	}
	
	/// Overload func for "update(_ array: [UInt8])".
	public func update(_ data: Data) {
		return update([UInt8](data))
	}
	
	
	
	/// Generate digest.
	///
	/// - Returns: A generated digest from current streaming state.
	public func digest() -> UInt64 {
		return h
	}
	
	
	/// Generate digest's hex string.
	///
	/// - Returns: A generated digest's hex string from current streaming state.
	public func digestHex() -> String {
		let h = digest()
		return Common.UInt64ToHex(h)
	}
	
}
