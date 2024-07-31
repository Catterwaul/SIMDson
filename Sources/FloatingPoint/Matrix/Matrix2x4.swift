/// A matrix with 2 columns and 4 rows.
public protocol Matrix2x4<Scalar>: Matrix2 where Column == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix3) -> Scalar.Matrix3x4
  @inlinable static func * (_: Self, _: MultipliableMatrix4) -> Scalar.Matrix4x4
}
