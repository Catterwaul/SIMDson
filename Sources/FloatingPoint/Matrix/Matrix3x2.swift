import Tuplé

public extension Matrix3x2 {
  /// Remove the bottom row from a 3x3 matrix.
  @inlinable init(_ matrix: Row.Matrix3) {
    self.init(columns: map(matrix.columns)(\.[]))
  }
}
