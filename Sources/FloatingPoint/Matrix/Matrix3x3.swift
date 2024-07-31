import Tuplé

public extension Matrix3x3 {
  /// Change the precision of a matrix.
  @inlinable init(_ matrix: some Matrix3x3) {
    self.init(columns: matrix.columns)
  }

  /// Creates a new matrix with the specified columns.
  @inlinable init(columns: Vectuple3<SIMD3<some BinaryFloatingPoint>>) {
    self.init(columns: map(columns)(SIMD3.init))
  }

  /// Create a matrix with two basis vectors, using their cross product as the third.
  @inlinable init(_ column0: Column, _ column1: Column) {
    self.init(column0, column1, .cross(column0, column1))
  }

  @inlinable init(_ quaternion: some Quaternion) {
    self.init(.init(quaternion))
  }
}
