//
//  ShapeCount.swift
//  
//
//  Created by Nail Sharipov on 05.08.2023.
//

public struct ShapeCount {

    var isEven: Bool { subj % 2 == 0 && clip % 2 == 0 }
    
    public let subj: Int
    public let clip: Int

    init(subj: Int, clip: Int) {
        self.subj = subj
        self.clip = clip
    }

    func add(_ count: ShapeCount) -> ShapeCount {
        ShapeCount(subj: subj + count.subj, clip: clip + count.clip)
    }

    func increment(shape: ShapeType) -> ShapeCount {
        let subjCnt = ShapeType.subject & shape != 0 ? 1 + subj : subj
        let clipCnt = ShapeType.clip & shape != 0 ? 1 + clip : clip
        return ShapeCount(subj: subjCnt, clip: clipCnt)
    }
}
