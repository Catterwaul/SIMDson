public protocol Matrix3x3<Scalar> {//}: Sendable {
  associatedtype Scalar: FloatingPointScalar
  typealias Vector = SIMD3<Scalar>

  static func * (matrix: Self, vector: Vector) -> Vector

  @inlinable init(_ column0: Vector, _ column1: Vector, _ column2: Vector)

  @inlinable var columns: (Vector, Vector, Vector) { get }
  @inlinable var inverse: Self { get }
}

import simd
extension float3x3: Matrix3x3, @retroactive @unchecked Sendable { }
extension double3x3: Matrix3x3, @retroactive @unchecked Sendable { }


// MARK: - public
public extension Matrix3x3 {
  /// Create a matrix with two basis vectors, using their cross product as the third.
  @inlinable init(_ column0: Vector, _ column1: Vector) {
    self.init(column0, column1, Scalar.cross(column0, column1))
  }
}
