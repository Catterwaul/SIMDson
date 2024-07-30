/// A matrix with 4 columns and 3 rows.
public protocol Matrix4x3<Scalar>: Matrix4 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x4) -> Scalar.Matrix2x3
  @inlinable static func * (_: Self, _: Scalar.Matrix3x4) -> Scalar.Matrix3x3
  @inlinable static func * (_: Self, _: Scalar.Matrix4x4) -> Self
  @inlinable static func *= (_: inout Self, _: Scalar.Matrix4x4)
}
