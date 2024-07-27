import simd

extension Double: FloatingPointScalar {
  public enum VectorRequirements: FloatingPointVectorRequirements {
    public typealias Scalar = Double

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

  // MARK: - Matrices
  public typealias Matrix2x2 = double2x2
  public typealias Matrix3x2 = double3x2
  public typealias Matrix3x3 = double3x3
  public typealias Matrix4x4 = double4x4
}

extension Double.Matrix2x2: Matrix2x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Double
}
extension Double.Matrix3x2: Matrix3x2, @retroactive @unchecked Sendable {
  public typealias Scalar = Double
}
extension Double.Matrix3x3: Matrix3x3, @retroactive @unchecked Sendable {
  public typealias Scalar = Double
}
extension Double.Matrix4x4: Matrix4x4, @retroactive @unchecked Sendable {
  public typealias Scalar = Double
}
