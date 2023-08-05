//
//  ShapeEdge.swift
//  
//
//  Created by Nail Sharipov on 04.08.2023.
//

import iFixFloat
import iShape

public struct ShapeEdge {
        
    @usableFromInline
    static let zero = ShapeEdge(a: .zero, b: .zero, count: ShapeCount(subj: 0, clip: 0))

    @inlinable
    var edge: FixEdge { FixEdge(e0: a, e1: b) }

    // start < end
    public let a: FixVec        // start
    public let b: FixVec        // end
    public let count: ShapeCount

    @inlinable
    init(a: FixVec, b: FixVec, count: ShapeCount) {
        if a.bitPack <= b.bitPack {
            self.a = a
            self.b = b
        } else {
            self.a = b
            self.b = a
        }
        self.count = count
    }
    
    @inlinable
    init(parent: ShapeEdge, count: ShapeCount) {
        self.a = parent.a
        self.b = parent.b
        self.count = count
    }
    
    @inlinable
    func merge(_ other: ShapeEdge) -> ShapeEdge {
        ShapeEdge(a: a, b: b, count: self.count.add(other.count))
    }

}
