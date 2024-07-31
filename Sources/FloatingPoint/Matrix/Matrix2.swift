import Tuplé

/// A matrix with 2 columns.
public protocol Matrix2<Scalar>: Matrix where Columns == Vectuple2<Column>, Row == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix2) -> Self
  @inlinable static func *= (_: inout Self, _: Row.Matrix2)

  @inlinable init(_ column0: Column, _ column1: Column)
}

/// A matrix with 2 columns and rows.
public protocol Matrix2x2<Scalar>: Matrix2 & SquareMatrix { }

/// A matrix with 2 columns and 3 rows.
public protocol Matrix2x3<Scalar>: Matrix2 where Column == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix3) -> Column.Matrix3
  @inlinable static func * (_: Self, _: Row.Matrix4) -> Column.Matrix4
}

/// A matrix with 2 columns and 4 rows.
public protocol Matrix2x4<Scalar>: Matrix2 where Column == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix3) -> Column.Matrix3
  @inlinable static func * (_: Self, _: Row.Matrix4) -> Column.Matrix4
}
