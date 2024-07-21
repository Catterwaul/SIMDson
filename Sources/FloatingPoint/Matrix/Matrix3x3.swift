public protocol Matrix3x3<Scalar> {//}: Sendable {
  associatedtype Scalar: SIMDScalar
  typealias Vector = SIMD3<Scalar>

  static func * (matrix: Self, vector: Vector) -> Vector

  @inlinable init(_ column0: Vector, _ column1: Vector, _ column2: Vector)

  @inlinable var inverse: Self { get }
}

import simd
extension float3x3: Matrix3x3, @retroactive @unchecked Sendable { }
extension double3x3: Matrix3x3, @retroactive @unchecked Sendable { }
