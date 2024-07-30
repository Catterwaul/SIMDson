public protocol Matrix<Scalar>: Sendable {
  associatedtype Scalar: FloatingPointScalar
  associatedtype Column: SIMD<Scalar>
  associatedtype Columns
  associatedtype Row: SIMD<Scalar>

  @inlinable prefix static func - (_: Self) -> Self
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
public protocol SquareMatrix: Matrix where Row == Column {
  @inlinable static func * (_: Self, _: Self) -> Self
  @inlinable static func *= (_: inout Self, _: Self)

  @inlinable var inverse: Self { get }
  @inlinable var determinant: Scalar { get }
}

/// A matrix with 2 columns.
public protocol Matrix2: Matrix where
  Columns == (Column, Column),
  Row == SIMD2<Scalar>
{
  @inlinable init(_ column0: Column, _ column1: Column)
}

/// A matrix with 3 columns.
public protocol Matrix3: Matrix where
  Columns == (Column, Column, Column),
  Row == SIMD3<Scalar>
{
  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column)
}

/// A matrix with 4 columns.
public protocol Matrix4: Matrix where
  Columns == (Column, Column, Column, Column),
  Row == SIMD4<Scalar>
{
  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column, _ column3: Column)
}
