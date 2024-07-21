import Tuplé

/// A matrix with 3 columns and 2 rows.
public protocol Matrix3x2<Scalar>: Matrix3 where Column == SIMD2<Scalar> { }

// MARK: - public
public extension Matrix3x2 {
  /// Remove the bottom row from a 3x3 matrix.
  @inlinable init(_ matrix: Scalar.Matrix3x3) {
    self.init(columns: map(matrix.columns)(\.[]))
  }
}
