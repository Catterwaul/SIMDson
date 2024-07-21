import Tuplé

/// A matrix with 3 columns and 2 rows.
public protocol Matrix3x2<Scalar>: Sendable {
  associatedtype Scalar: SIMDScalar
  typealias Column = SIMD2<Scalar>
  typealias Row = SIMD3<Scalar>

  static func * (matrix: Self, vector: Row) -> Column

  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column)
  @inlinable init(columns: (Column, Column, Column))
}

import simd
extension float3x2: Matrix3x2, @retroactive @unchecked Sendable { }
extension double3x2: Matrix3x2, @retroactive @unchecked Sendable { }

// MARK: - public
public extension Matrix3x2 {
  /// Create a matrix with two basis vectors, using their cross product as the third.
  @inlinable init(_ matrix: some Matrix3x3<Scalar>) {
    self.init(columns: map(matrix.columns)(\.[SIMD2(0, 1)]))
  }
}
