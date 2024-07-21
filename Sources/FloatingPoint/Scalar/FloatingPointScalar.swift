/// An affordance for collecting free functions from `simd` into types,
/// so that they can be used generically.
/// Probably not directly useful outside of SIMDson.
public protocol FloatingPointScalar: SIMDScalar & BinaryFloatingPoint & Codable & Sendable {
  // MARK: - Matrices
  associatedtype Matrix2x2: SIMDson.Matrix2x2<Self>

  /// 3 columns, 2 rows.
  associatedtype Matrix3x2: SIMDson.Matrix3x2<Self>

  associatedtype Matrix3x3: SIMDson.Matrix3x3<Self>

  // MARK: - normalize
  @inlinable static func normalize(_ vector: SIMD2<Self>) -> SIMD2<Self>
  @inlinable static func normalize(_ vector: SIMD3<Self>) -> SIMD3<Self>
  @inlinable static func normalize(_ vector: SIMD4<Self>) -> SIMD4<Self>

  // MARK: -

  @inlinable static func cross(_ x: SIMD3<Self>, _ y: SIMD3<Self>) -> SIMD3<Self>
}
