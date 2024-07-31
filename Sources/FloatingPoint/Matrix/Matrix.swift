import Tuplé

public protocol Matrix<Scalar>: Sendable {
  associatedtype Scalar: FloatingPointScalar
  associatedtype Column: FloatingPointVector<Scalar>
  /// A tuple of `Column`s
  associatedtype Columns
  associatedtype Row: FloatingPointVector<Scalar>

  /// A matrix with 2 columns and as many rows as this matrix has columns.
  /// - Bug: Should be expressible as `Column.Matrix2`
  associatedtype MultipliableMatrix2: SIMDson.Matrix2<Scalar>
  /// A matrix with 3 columns and as many rows as this matrix has columns.
  /// - Bug: Should be expressible as `Column.Matrix2`
  associatedtype MultipliableMatrix3: SIMDson.Matrix3<Scalar>
  /// A matrix with 4 columns and as many rows as this matrix has columns.
  /// - Bug: Should be expressible as `Column.Matrix2`
  associatedtype MultipliableMatrix4: SIMDson.Matrix4<Scalar>

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

  @inlinable static func * (_: Self, _: MultipliableMatrix2) -> MultipliableMatrix2
  @inlinable static func * (_: Self, _: MultipliableMatrix3) -> MultipliableMatrix3
  @inlinable static func * (_: Self, _: MultipliableMatrix4) -> MultipliableMatrix4

  @inlinable var inverse: Self { get }
  @inlinable var determinant: Scalar { get }
}

/// A matrix with 2 columns.
public protocol Matrix2<Scalar>: Matrix where Columns == Vectuple2<Column>, Row == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix2) -> Self
  @inlinable static func *= (_: inout Self, _: MultipliableMatrix2)

  @inlinable init(_ column0: Column, _ column1: Column)
}

/// A matrix with 3 columns.
public protocol Matrix3<Scalar>: Matrix where Columns == Vectuple3<Column>, Row == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix3) -> Self
  @inlinable static func *= (_: inout Self, _: MultipliableMatrix3)

  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column)
}

/// A matrix with 4 columns.
public protocol Matrix4<Scalar>: Matrix where Columns == Vectuple4<Column>, Row == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: MultipliableMatrix4) -> Self
  @inlinable static func *= (_: inout Self, _: MultipliableMatrix4)
  
  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column, _ column3: Column)
}
