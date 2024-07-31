/// A matrix with 2 columns and 3 rows.
public protocol Matrix2x3<Scalar>: Matrix2 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix3) -> Scalar.Matrix3x3
  @inlinable static func * (_: Self, _: MultipliableMatrix4) -> Scalar.Matrix4x3
}
