/// A matrix with 2 columns and 4 rows.
public protocol Matrix2x4<Scalar>: Matrix2 where Column == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x2) -> Scalar.Matrix2x4
}
