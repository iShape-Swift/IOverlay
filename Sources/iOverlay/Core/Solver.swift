//
//  Solver.swift
//
//
//  Created by Nail Sharipov on 05.03.2024.
//


/// Represents the selection strategy or algorithm for processing geometric data, aimed at optimizing performance under various conditions.
///
/// This enum allows for the explicit selection of a computational approach to geometric data processing. The choice of solver is crucial as it directly affects the efficiency of operations, especially in relation to the complexity and size of the dataset involved.
///
/// Cases:
/// - `list`: A linear list-based approach for organizing and processing geometric data. Typically performs better for smaller datasets, approximately with fewer than 10,000 edges, due to its straightforward processing model. For small to moderate datasets, this method can offer a balance of simplicity and speed.
/// - `tree`: Implements a tree-based data structure (e.g., a binary search tree or a spatial partitioning tree) to manage geometric data. This method is generally more efficient for larger datasets or scenarios requiring complex spatial queries, as it can significantly reduce the number of comparisons needed for operations. However, its performance advantage becomes more apparent as the dataset size exceeds a certain threshold (roughly estimated at 10,000 edges).
/// - `auto`: Delegates the choice of solver to the system, which determines the most suitable approach based on the size and complexity of the dataset. This option is designed to dynamically select between `list` and `tree` strategies, aiming to optimize performance without requiring a priori knowledge of the data's characteristics. It's the recommended choice for users looking for a balance between performance and ease of use, as it adapts to the specific requirements of each operation.
public enum Strategy {
    case list
    case tree
    case auto
}

public struct Solver {
    public static let list = Solver(strategy: .list, chunkStartLength: 8, chunkListMaxSize: 64, treeListThreshold: 5000)
    public static let tree = Solver(strategy: .tree, chunkStartLength: 8, chunkListMaxSize: 64, treeListThreshold: 5000)
    public static let auto = Solver(strategy: .auto, chunkStartLength: 8, chunkListMaxSize: 64, treeListThreshold: 5000)
    
    public let strategy: Strategy
    public let chunkStartLength: Int
    public let chunkListMaxSize: Int
    public let treeListThreshold: Int
}
