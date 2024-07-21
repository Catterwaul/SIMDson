/// An affordance for collecting free functions from `simd` into types. Probably not directly useful outside of SIMDson.
public protocol FloatingPointScalar: SIMDScalar & BinaryFloatingPoint & Codable & Sendable {
  associatedtype Matrix2x2: SIMDson.Matrix2x2<Self>
  associatedtype Matrix3x2: SIMDson.Matrix3x2<Self>
  associatedtype Matrix3x3: SIMDson.Matrix3x3<Self>

  @inlinable static func normalize(_ vector: SIMD2<Self>) -> SIMD2<Self>
  @inlinable static func normalize(_ vector: SIMD3<Self>) -> SIMD3<Self>
  @inlinable static func normalize(_ vector: SIMD4<Self>) -> SIMD4<Self>

  @inlinable static func cross(_ x: SIMD3<Self>, _ y: SIMD3<Self>) -> SIMD3<Self>
}
