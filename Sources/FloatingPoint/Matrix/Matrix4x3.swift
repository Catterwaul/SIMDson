/// A matrix with 4 columns and 3 rows.
public protocol Matrix4x3<Scalar>: Matrix4 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix2) -> Scalar.Matrix2x3
  @inlinable static func * (_: Self, _: MultipliableMatrix3) -> Scalar.Matrix3x3
}
