public protocol Matrix<Scalar>: Sendable {
  associatedtype Scalar: FloatingPointScalar
  associatedtype Column: FloatingPointVector<Scalar>
  /// A tuple of `Column`s
  associatedtype Columns
  associatedtype Row: FloatingPointVector<Scalar>

  @inlinable prefix static func -(_: Self) -> Self
  @inlinable static func * (_: Self, _: Row) -> Column
  @inlinable static func * (_: Self, _: Scalar) -> Self
  @inlinable static func *= (_: inout Self, _: Scalar)
  @inlinable static func * (_: Scalar, _: Self) -> Self
  @inlinable static func + (_: Self, _: Self) -> Self
  @inlinable static func += (_: inout Self, _: Self)
  @inlinable static func - (_: Self, _: Self) -> Self
  @inlinable static func -= (_: inout Self, _: Self)

  @inlinable init(columns: Columns)

  @inlinable var columns: Columns { get }
}

/// A matrix with the same number of columns and rows.
public protocol SquareMatrix<Scalar>: Matrix where Row == Column {
  /// Either a column or row vector.
  typealias Vector = Column

  @inlinable var inverse: Self { get }
  @inlinable var determinant: Scalar { get }
}
