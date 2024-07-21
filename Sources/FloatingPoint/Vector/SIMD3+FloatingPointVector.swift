extension SIMD3: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}

// MARK: - public
public extension SIMD3 where Self: FloatingPointVector {
  @inlinable func isBetween(_ vector0: Self, and vector1: Self) -> Bool {
    let localProjection = Scalar.Matrix3x2(
      Scalar.Matrix3x3(vector0, vector1).inverse
    ) * self
    return all(localProjection .>= 0)
  }
}
