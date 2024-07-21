// MARK: FloatingPointVector
extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}

// MARK: - public
public extension SIMD2 where Self: FloatingPointVector {
  @inlinable func isBetween(_ vector0: Self, and vector1: Self) -> Bool {
    all(Scalar.Matrix2x2(vector0, vector1).inverse * self .>= 0)
  }
}
