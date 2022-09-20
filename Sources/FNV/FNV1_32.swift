//
//  FNV1_32.swift
//  FNV
//
//  Created by Daisuke T on 2019/03/06.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

extension FNV {
    
    /// FNV-1 32bit class
    public class FNV1_32 {
        
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
extension FNV.FNV1_32 {
    
    /// Generate digest.
    ///
    /// - Parameter sequence: A source data for hash.
    /// - Returns: A generated digest.
    static public func digest<S: Sequence>(_ sequence: S) -> UInt32 where S.Element == UInt8 {
        return Common.fnv1(sequence, offsetBasis: Common.offsetBasis32, prime: Common.prime32)
    }
    
    /// Overload func for "digest(_ sequence: Sequence)".
    static public func digest(_ string: String) -> UInt32 {
        return digest(string.utf8)
    }


    
    /// Generate digest's hex string.
    ///
    /// - Parameters:
    ///   - sequence: A source data for hash.
    /// - Returns: A generated digest's hex string.
    static public func digestHex<S: Sequence>(_ sequence: S) -> String where S.Element == UInt8 {
        let h = digest(sequence)
        return Common.UInt32ToHex(h)
    }
    
    /// Overload func for "digestHex(_ sequence: Sequence)".
    static public func digestHex(_ string: String) -> String {
        let h = digest(string)
        return Common.UInt32ToHex(h)
    }

}



// MARK: - Digest(Streaming)
extension FNV.FNV1_32 {
    
    /// Reset current streaming state to initial.
    public func reset() {
        h = Common.offsetBasis32
    }
    
    
    /// Update streaming state.
    ///
    /// - Parameter sequence: A source data for hash.
    public func update<S: Sequence>(_ sequence: S) where S.Element == UInt8 {
        h = Common.fnv1(sequence, offsetBasis: h, prime: Common.prime32)
    }
    
    /// Overload func for "update(_ sequence: Sequence)".
    public func update(_ string: String) {
        return update(string.utf8)
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
