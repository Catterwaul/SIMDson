import simd

extension Double: FloatingPointScalar {
  public enum VectorRequirements: FloatingPointVectorRequirements {
    public typealias Scalar = Double

    @inlinable public static func cross(_ x: SIMD3<Scalar>, _ y: SIMD3<Scalar>) -> SIMD3<Scalar> {
      simd.cross(x, y)
    }

    // MARK: - dot
    @inlinable public static func dot(_ vector0: SIMD2<Scalar>, _ vector1: SIMD2<Scalar>) -> Scalar {
      simd.dot(vector0, vector1)
    }
    @inlinable public static func dot(_ vector0: SIMD3<Scalar>, _ vector1: SIMD3<Scalar>) -> Scalar {
      simd.dot(vector0, vector1)
    }
    @inlinable public static func dot(_ vector0: SIMD4<Scalar>, _ vector1: SIMD4<Scalar>) -> Scalar {
      simd.dot(vector0, vector1)
    }

    // MARK: - magnitude
    @inlinable public static func magnitude(_ vector: SIMD2<Scalar>) -> Scalar {
      simd.length(vector)
    }
    @inlinable public static func magnitude(_ vector: SIMD3<Scalar>) -> Scalar {
      simd.length(vector)
    }
    @inlinable public static func magnitude(_ vector: SIMD4<Scalar>) -> Scalar {
      simd.length(vector)
    }

    // MARK: - mix
    @inlinable public static func mix(_ vector0: SIMD2<Scalar>, _ vector1: SIMD2<Scalar>, mix: Scalar) -> SIMD2<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    @inlinable public static func mix(_ vector0: SIMD2<Scalar>, _ vector1: SIMD2<Scalar>, mix: SIMD2<Scalar>) -> SIMD2<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    @inlinable public static func mix(_ vector0: SIMD3<Scalar>, _ vector1: SIMD3<Scalar>, mix: Scalar) -> SIMD3<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    @inlinable public static func mix(_ vector0: SIMD3<Scalar>, _ vector1: SIMD3<Scalar>, mix: SIMD3<Scalar>) -> SIMD3<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    @inlinable public static func mix(_ vector0: SIMD4<Scalar>, _ vector1: SIMD4<Scalar>, mix: Scalar) -> SIMD4<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    @inlinable public static func mix(_ vector0: SIMD4<Scalar>, _ vector1: SIMD4<Scalar>, mix: SIMD4<Scalar>) -> SIMD4<Scalar> {
      simd.mix(vector0, vector1, t: mix)
    }

    // MARK: - normalize
    @inlinable public static func normalize(_ vector: SIMD2<Scalar>) -> SIMD2<Scalar> {
      simd.normalize(vector)
    }
    
    @inlinable public static func normalize(_ vector: SIMD3<Scalar>) -> SIMD3<Scalar> {
      simd.normalize(vector)
    }
    
    @inlinable public static func normalize(_ vector: SIMD4<Scalar>) -> SIMD4<Scalar> {
      simd.normalize(vector)
    }
  }

  public typealias Quaternion = simd_quatd

  // MARK: - Matrices
  public typealias Matrix2x2 = double2x2
  public typealias Matrix2x3 = double2x3
  public typealias Matrix2x4 = double2x4
  public typealias Matrix3x2 = double3x2
  public typealias Matrix3x3 = double3x3
  public typealias Matrix3x4 = double3x4
  public typealias Matrix4x2 = double4x2
  public typealias Matrix4x3 = double4x3
  public typealias Matrix4x4 = double4x4
}

extension Double.Quaternion: Quaternion {
  public typealias Scalar = Double
}
