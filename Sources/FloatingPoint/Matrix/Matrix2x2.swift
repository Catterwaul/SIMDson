public protocol Matrix2x2<Scalar>: Sendable {
  associatedtype Scalar: SIMDScalar
  typealias Vector = SIMD2<Scalar>

  static func * (matrix: Self, vector: Vector) -> Vector

  @inlinable init(_ column0: Vector, _ column1: Vector)
  
  @inlinable var inverse: Self { get }
}

import simd
extension float2x2: Matrix2x2, @retroactive @unchecked Sendable { }
extension double2x2: Matrix2x2, @retroactive @unchecked Sendable { }
