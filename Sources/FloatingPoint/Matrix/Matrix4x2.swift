/// A matrix with 4 columns and 2 rows.
public protocol Matrix4x2<Scalar>: Matrix4 where Column == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x4) -> Scalar.Matrix2x2
}
