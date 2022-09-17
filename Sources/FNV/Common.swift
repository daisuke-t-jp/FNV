//
//  Common.swift
//  FNV
//
//  Created by Daisuke T on 2019/03/06.
//  Copyright © 2019 FNV. All rights reserved.
//

import Foundation

final class Common {
    
    // MARK: - Enum, Const
    static let offsetBasis32: UInt32 = 2166136261
    static let offsetBasis64: UInt64 = 14695981039346656037
    static let prime32: UInt32 = 16777619
    static let prime64: UInt64 = 1099511628211
    
}



// MARK: - Utility
extension Common {
    
    static func UInt32ToHex(_ val: UInt32) -> String {
        return String.init(format: "%08x", val)
    }
    
    static func UInt64ToHex(_ val: UInt64) -> String {
        return String.init(format: "%016lx", val)
    }
    
}



// MARK: - Algorithm
extension Common {
    
    static func fnv1<S: Sequence, T: FixedWidthInteger>(_ sequence: S, offsetBasis: T, prime: T) -> T  where S.Element == UInt8 {
        var hash: T = offsetBasis
        
        for elm in sequence {
            hash = hash &* prime
            hash = hash ^ T(elm)
        }
        
        return hash
    }
    
    static func fnv1a<S: Sequence, T: FixedWidthInteger>(_ sequence: S, offsetBasis: T, prime: T) -> T where S.Element == UInt8 {
        var hash: T = offsetBasis
        
        for elm in sequence {
            hash = hash ^ T(elm)
            hash = hash &* prime
        }
        
        return hash
    }
    
}
