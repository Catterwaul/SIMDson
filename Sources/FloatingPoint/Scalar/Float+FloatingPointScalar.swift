import simd

extension Float: FloatingPointScalar {
  public enum VectorRequirements: FloatingPointVectorRequirements {
    public typealias Scalar = Float

    @inlinable public static func cross(_ x: SIMD3<Scalar>, _ y: SIMD3<Scalar>) -> SIMD3<Scalar> {
      simd.cross(x, y)
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
  public typealias Matrix3x2 = float3x2
  public typealias Matrix3x3 = float3x3
  public typealias Matrix4x4 = float4x4
}

extension Float.Quaternion: Quaternion {
  public typealias Scalar = Float
}

extension Float.Matrix3x2: Matrix3x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix2x2: Matrix2x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix3x3: Matrix3x3, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
extension Float.Matrix4x4: Matrix4x4, @retroactive @unchecked Sendable {
  public typealias Scalar = Float
}
