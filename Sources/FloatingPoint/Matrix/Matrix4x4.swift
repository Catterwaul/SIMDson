import Tuplé

public protocol Matrix4x4<Scalar>: Matrix4 & SquareMatrix
where
  Column == SIMD4<Scalar>,
  Matrix2 == Scalar.Matrix2x4,
  Matrix3 == Scalar.Matrix3x4,
  Matrix4 == Scalar.Matrix4x4
{ }

public extension Matrix4x4 {
  /// Change the precision of a matrix.
  @inlinable init(_ matrix: some Matrix4x4) {
    self.init(columns: matrix.columns)
  }

  /// Creates a new matrix with the specified columns.
  @inlinable init(columns: Vectuple4<SIMD4<some BinaryFloatingPoint>>) {
    self.init(columns: map(columns)(SIMD4.init))
  }
}
