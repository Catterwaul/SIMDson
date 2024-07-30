// MARK:  FloatingPointVector
extension SIMD4: FloatingPointVector where Scalar: FloatingPointScalar {
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
