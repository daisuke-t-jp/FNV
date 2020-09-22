//
//  FNV1a_32.swift
//  FNV
//
//  Created by Daisuke T on 2019/03/06.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

extension FNV {
    
    /// FNV-1a 32bit class
    public class FNV1a_32 {
        
        // MARK: - Enum, Const
        private var h: UInt32 = Common.offsetBasis32
        
        
        
        // MARK: - Life cycle
        
        /// Creates a new instance with the seed.
        public init() {
            reset()
        }
    }
    
}



// MARK: - Digest(One-shot)
extension FNV.FNV1a_32 {
    
    /// Generate digest.
    ///
    /// - Parameter array: A source data for hash.
    /// - Returns: A generated digest.
    static public func digest(_ array: [UInt8]) -> UInt32 {
        return Common.fnv1a(array, offsetBasis: Common.offsetBasis32, prime: Common.prime32)
    }
    
    /// Overload func for "digest(_ array: [UInt8])".
    static public func digest(_ string: String) -> UInt32 {
        return digest(Array(string.utf8))
    }
    
    /// Overload func for "digest(_ array: [UInt8])".
    static public func digest(_ data: Data) -> UInt32 {
        return digest([UInt8](data))
    }
    
    
    /// Generate digest's hex string.
    ///
    /// - Parameters:
    ///   - array: A source data for hash.
    /// - Returns: A generated digest's hex string.
    static public func digestHex(_ array: [UInt8]) -> String {
        let h = digest(array)
        return Common.UInt32ToHex(h)
    }
    
    /// Overload func for "digestHex(_ array: [UInt8])".
    static public func digestHex(_ string: String) -> String {
        let h = digest(string)
        return Common.UInt32ToHex(h)
    }
    
    /// Overload func for "digestHex(_ array: [UInt8])".
    static public func digestHex(_ data: Data) -> String {
        let h = digest(data)
        return Common.UInt32ToHex(h)
    }
    
}



// MARK: - Digest(Streaming)
extension FNV.FNV1a_32 {
    
    /// Reset current streaming state to initial.
    public func reset() {
        h = Common.offsetBasis32
    }
    
    
    /// Update streaming state.
    ///
    /// - Parameter array: A source data for hash.
    public func update(_ array: [UInt8]) {
        h = Common.fnv1a(array, offsetBasis: h, prime: Common.prime32)
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
    public func digest() -> UInt32 {
        return h
    }
    
    
    /// Generate digest's hex string.
    ///
    /// - Returns: A generated digest's hex string from current streaming state.
    public func digestHex() -> String {
        let h = digest()
        return Common.UInt32ToHex(h)
    }
    
}
