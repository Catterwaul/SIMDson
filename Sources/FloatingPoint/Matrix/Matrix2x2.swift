public protocol Matrix2x2<Scalar>: Matrix2 & SquareMatrix
where
  Column == SIMD2<Scalar>,
  Matrix2 == Scalar.Matrix2x2,
  Matrix3 == Scalar.Matrix3x2,
  Matrix4 == Scalar.Matrix4x2
{ }
