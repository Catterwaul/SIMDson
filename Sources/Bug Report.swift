protocol FloatingPointScalar: SIMDScalar & BinaryFloatingPoint & Codable {
  associatedtype Matrix3x3
}

protocol FloatingPointVector<Scalar>: SIMD { }
extension SIMD2: FloatingPointVector { }
extension SIMD3: FloatingPointVector where Scalar.Matrix3x3: Matrix3x3<Scalar> { }


protocol Matrix<Scalar> {
  associatedtype Scalar: FloatingPointScalar
  associatedtype Column: FloatingPointVector<Scalar>
  associatedtype Columns
  associatedtype Row: FloatingPointVector<Scalar>
}

protocol SquareMatrix<Scalar>: Matrix where Row == Column { }

protocol Matrix2<Scalar>: Matrix where Columns == (Column, Column), Row == SIMD2<Scalar> { }

protocol Matrix2x3<Scalar>: Matrix2 where Column == SIMD3<Scalar>
//, Scalar.Matrix3x3: Matrix3x3<Scalar>
{ }

protocol Matrix3<Scalar>: Matrix where
  Columns == (Column, Column, Column), Row == SIMD3<Scalar>,
  Scalar.Matrix3x3: Matrix3x3<Scalar>
{ }

protocol Matrix3x3<Scalar>: Matrix3 & SquareMatrix { }
