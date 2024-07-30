public protocol Matrix2x2<Scalar>: Matrix2 & SquareMatrix where Column == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix3x2) -> Scalar.Matrix3x2
}
