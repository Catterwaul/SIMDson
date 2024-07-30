/// A matrix with 3 columns and 4 rows.
public protocol Matrix3x4<Scalar>: Matrix3 where Column == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x3) -> Scalar.Matrix2x4
  @inlinable static func * (_: Self, _: Scalar.Matrix3x3) -> Self
  @inlinable static func *= (_: inout Self, _: Scalar.Matrix3x3)
}
