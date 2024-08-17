// MARK: FloatingPointVector
extension SIMD3: FloatingPointVector where Scalar: FloatingPointScalar {
  /// A matrix with 2 columns of this vector.
  public typealias Matrix2 = Scalar.Matrix2x3
  /// A matrix with 3 columns of this vector.
  public typealias Matrix3 = Scalar.Matrix3x3
  /// A matrix with 4 columns of this vector.
  public typealias Matrix4 = Scalar.Matrix4x3

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
public extension SIMD3 where Self: FloatingPointVector {
  @inlinable static func cross(_ x: Self, _ y: Self) -> Self {
    Scalar.VectorRequirements.cross(x, y)
  }
}
