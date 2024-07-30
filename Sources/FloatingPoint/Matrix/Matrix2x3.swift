/// A matrix with 2 columns and 3 rows.
public protocol Matrix2x3<Scalar>: Matrix2 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x2) -> Self
  @inlinable static func *= (_: inout Self, _: Scalar.Matrix2x2)
  @inlinable static func * (_: Self, _: Scalar.Matrix3x2) -> Scalar.Matrix3x3
  @inlinable static func * (_: Self, _: Scalar.Matrix4x2) -> Scalar.Matrix4x3
}
