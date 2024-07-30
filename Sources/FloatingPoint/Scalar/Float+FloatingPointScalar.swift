import simd

extension Float: FloatingPointScalar {
  public enum VectorRequirements: FloatingPointVectorRequirements {
    public typealias Scalar = Float

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

  public typealias Quaternion = simd_quatf

  // MARK: - Matrices
  public typealias Matrix2x2 = float2x2
  public typealias Matrix2x3 = float2x3
  public typealias Matrix2x4 = float2x4
  public typealias Matrix3x2 = float3x2
  public typealias Matrix3x3 = float3x3
  public typealias Matrix3x4 = float3x4
  public typealias Matrix4x2 = float4x2
  public typealias Matrix4x3 = float4x3
  public typealias Matrix4x4 = float4x4
}

extension Float.Quaternion: Quaternion {
  public typealias Scalar = Float
}

extension Float.Matrix2x2: Matrix2x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix2x3: Matrix2x3, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix2x4: Matrix2x4, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix3x2: Matrix3x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix3x3: Matrix3x3, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix3x4: Matrix3x4, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix4x2: Matrix4x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix4x3: Matrix4x3, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix4x4: Matrix4x4, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
