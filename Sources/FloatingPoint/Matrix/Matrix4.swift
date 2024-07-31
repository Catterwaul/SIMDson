import Tuplé

/// A matrix with 4 columns.
public protocol Matrix4<Scalar>: Matrix where Columns == Vectuple4<Column>, Row == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix4) -> Self
  @inlinable static func *= (_: inout Self, _: Row.Matrix4)

  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column, _ column3: Column)
}

/// A matrix with 4 columns and 2 rows.
public protocol Matrix4x2<Scalar>: Matrix4 where Column == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix2) -> Column.Matrix2
  @inlinable static func * (_: Self, _: Row.Matrix3) -> Column.Matrix3
}

/// A matrix with 4 columns and 3 rows.
public protocol Matrix4x3<Scalar>: Matrix4 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix2) -> Column.Matrix2
  @inlinable static func * (_: Self, _: Row.Matrix3) -> Column.Matrix3
}

/// A matrix with 4 columns and rows.
public protocol Matrix4x4<Scalar>: Matrix4 & SquareMatrix { }
