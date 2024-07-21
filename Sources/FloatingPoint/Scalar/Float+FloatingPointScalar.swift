import simd

extension Float: FloatingPointScalar {
  // MARK: - Matrices
  public typealias Matrix2x2 = float2x2
  public typealias Matrix3x2 = float3x2
  public typealias Matrix3x3 = float3x3

  // MARK: - normalize
  @inlinable public static func normalize(_ vector: SIMD2<Self>) -> SIMD2<Self> {
    simd.normalize(vector)
  }

  @inlinable public static func normalize(_ vector: SIMD3<Self>) -> SIMD3<Self> {
    simd.normalize(vector)
  }

  @inlinable public static func normalize(_ vector: SIMD4<Self>) -> SIMD4<Self> {
    simd.normalize(vector)
  }

  // MARK: -

  @inlinable public static func cross(_ x: SIMD3<Self>, _ y: SIMD3<Self>) -> SIMD3<Self> {
    simd.cross(x, y)
  }
}
