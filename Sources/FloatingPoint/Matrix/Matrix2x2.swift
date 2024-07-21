public protocol Matrix2x2<Scalar>: SquareMatrix where Column == SIMD2<Scalar> {
  @inlinable init(_ column0: Column, _ column1: Column)
}
