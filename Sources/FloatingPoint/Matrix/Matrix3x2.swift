import Tuplé

/// A matrix with 3 columns and 2 rows.
public protocol Matrix3x2<Scalar>: Matrix3 where Column == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Scalar.Matrix2x3) -> Scalar.Matrix2x2
  @inlinable static func * (_: Self, _: Scalar.Matrix4x3) -> Scalar.Matrix4x2
}

// MARK: - public
public extension Matrix3x2 {
  /// Remove the bottom row from a 3x3 matrix.
  @inlinable init(_ matrix: Scalar.Matrix3x3) {
    self.init(columns: map(matrix.columns)(\.[]))
  }
}
