import simd

extension Double: FloatingPointScalar {
  public typealias Matrix2x2 = double2x2
  
  @inlinable public static func normalize(_ vector: SIMD2<Self>) -> SIMD2<Self> {
    simd.normalize(vector)
  }

  @inlinable public static func normalize(_ vector: SIMD3<Self>) -> SIMD3<Self> {
    simd.normalize(vector)
  }

  @inlinable public static func normalize(_ vector: SIMD4<Self>) -> SIMD4<Self> {
    simd.normalize(vector)
  }
}
