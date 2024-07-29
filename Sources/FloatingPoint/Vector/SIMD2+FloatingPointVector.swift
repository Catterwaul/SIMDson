// MARK:  FloatingPointVector
extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.VectorRequirements.normalize(self) }

  @inlinable public var magnitude: Scalar {
    get { Scalar.VectorRequirements.magnitude(self) }
    set { self = normalized * newValue }
  }
}

// MARK: - public
public extension SIMD2 where Self: FloatingPointVector {
  /// Whether a vector points somewhere between two others.
  @inlinable func isBetween(_ vector0: Self, and vector1: Self) -> Bool {
    all(Scalar.Matrix2x2(vector0, vector1).inverse * self .>= 0)
  }
}
