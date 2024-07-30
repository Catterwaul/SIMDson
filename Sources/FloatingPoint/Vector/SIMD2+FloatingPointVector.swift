// MARK:  FloatingPointVector
extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public static func • (_ vector0: Self, _ vector1: Self) -> Scalar {
    Scalar.VectorRequirements.dot(vector0, vector1)
  }

  @inlinable public static func mix(_ vector0: Self, _ vector1: Self, mix: Scalar) -> Self {
    Scalar.VectorRequirements.mix(vector0, vector1, mix: mix)
  }

  @inlinable public static func mix(_ vector0: Self, _ vector1: Self, mix: Self) -> Self {
    Scalar.VectorRequirements.mix(vector0, vector1, mix: mix)
  }

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
