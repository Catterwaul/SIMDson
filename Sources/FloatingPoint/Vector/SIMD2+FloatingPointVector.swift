// MARK: FloatingPointVector
extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  /// A matrix with 2 columns of this vector.
  public typealias Matrix2 = Scalar.Matrix2x2
  /// A matrix with 3 columns of this vector.
  public typealias Matrix3 = Scalar.Matrix3x2
  /// A matrix with 4 columns of this vector.
  public typealias Matrix4 = Scalar.Matrix4x2

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
  @inlinable func isBetween(_ vector0: Self, and vector1: Self) -> Bool
  where Matrix2: Matrix2x2<Scalar> {
    all(Matrix2(vector0, vector1).inverse * self .>= 0)
  }
}
