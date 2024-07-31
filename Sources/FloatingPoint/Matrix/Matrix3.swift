import Tuplé

/// A matrix with 3 columns.
public protocol Matrix3<Scalar>: Matrix where Columns == Vectuple3<Column>, Row == SIMD3<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix3) -> Self
  @inlinable static func *= (_: inout Self, _: Row.Matrix3)

  @inlinable init(_ column0: Column, _ column1: Column, _ column2: Column)
}

/// A matrix with 3 columns and 2 rows.
public protocol Matrix3x2<Scalar>: Matrix3 where Column == SIMD2<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix2) -> Column.Matrix2
  @inlinable static func * (_: Self, _: Row.Matrix4) -> Column.Matrix4
}

/// A matrix with 3 columns and rows.
public protocol Matrix3x3<Scalar>: Matrix3 & SquareMatrix {
  init(_ quaternion: Scalar.Quaternion)
}

/// A matrix with 3 columns and 4 rows.
public protocol Matrix3x4<Scalar>: Matrix3 where Column == SIMD4<Scalar> {
  @inlinable static func * (_: Self, _: Row.Matrix2) -> Column.Matrix2
  @inlinable static func * (_: Self, _: Row.Matrix4) -> Column.Matrix4
}
