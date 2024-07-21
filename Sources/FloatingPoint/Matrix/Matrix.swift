public protocol Matrix<Scalar>: Sendable {
  associatedtype Scalar: FloatingPointScalar
  associatedtype Column: SIMD<Scalar>
  associatedtype Columns
  associatedtype Row: SIMD<Scalar>

  static func * (matrix: Self, vector: Row) -> Column

  @inlinable init(columns: Columns)

  var columns: Columns { get }
}

public protocol SquareMatrix: Matrix where Row == Column {
  @inlinable var inverse: Self { get }
}

/// A matrix with 3 columns.
public protocol Matrix3: Matrix where
  Columns == (Column, Column, Column),
  Row == SIMD3<Scalar>
{
  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column)
}
