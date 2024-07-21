public protocol Matrix3x3<Scalar>: Matrix3 & SquareMatrix { }

// MARK: - public
public extension Matrix3x3 {
  /// Create a matrix with two basis vectors, using their cross product as the third.
  @inlinable init(_ column0: Column, _ column1: Column) {
    self.init(column0, column1, Scalar.cross(column0, column1))
  }
}
