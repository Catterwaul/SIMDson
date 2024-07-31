import Tuplé

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
