/// A type that is used as a scalar by `SIMD` vectors and matrices.
public protocol FloatingPointScalar: SIMDScalar & BinaryFloatingPoint & Codable & Sendable {
  /// A utility for matching types and free functions from
  /// [`simd`](https://developer.apple.com/documentation/accelerate/simd)
  /// with their associated scalars, so that they can be used generically.
  ///
  /// SIMD vectors cannot conditionally conform to `FloatingPointVector` for each type of `FloatingPointScalar`.
  /// (A type cannot have more than one conformance to a protocol, even with different conditional bounds.)
  ///
  /// So instead of matching global `simd` code directly to constrained `SIMD` vectors,
  /// that code is collected here, instead, where it can be used from each `FloatingPointVector`
  /// by way of its `Scalar.VectorRequirements`.
  associatedtype VectorRequirements: FloatingPointVectorRequirements<Self>

  associatedtype Quaternion: SIMDson.Quaternion

  // MARK: - Matrices
  associatedtype Matrix2x2: SIMDson.Matrix2x2<Self>
  // A matrix with 2 columns and 3 rows.
  associatedtype Matrix2x3: SIMDson.Matrix2x3<Self>
  // A matrix with 2 columns and 4 rows.
  associatedtype Matrix2x4: SIMDson.Matrix2x4<Self>
  // A matrix with 3 columns and 2 rows.
  associatedtype Matrix3x2: SIMDson.Matrix3x2<Self>
  associatedtype Matrix3x3: SIMDson.Matrix3x3<Self>
  // A matrix with 3 columns and 4 rows.
  associatedtype Matrix3x4: SIMDson.Matrix3x4<Self>
  // A matrix with 4 columns and 2 rows.
  associatedtype Matrix4x2: SIMDson.Matrix4x2<Self>
  // A matrix with 4 columns and 3 rows.
  associatedtype Matrix4x3: SIMDson.Matrix4x3<Self>
  associatedtype Matrix4x4: SIMDson.Matrix4x4<Self>
}

public protocol FloatingPointVectorRequirements<Scalar> {
  associatedtype Scalar: FloatingPointScalar

  @inlinable static func cross(_: SIMD3<Scalar>, _: SIMD3<Scalar>) -> SIMD3<Scalar>

  // MARK: - dot
  @inlinable static func dot(_: SIMD2<Scalar>, _: SIMD2<Scalar>) -> Scalar
  @inlinable static func dot(_: SIMD3<Scalar>, _: SIMD3<Scalar>) -> Scalar
  @inlinable static func dot(_: SIMD4<Scalar>, _: SIMD4<Scalar>) -> Scalar

  // MARK: - magnitude
  @inlinable static func magnitude(_: SIMD2<Scalar>) -> Scalar
  @inlinable static func magnitude(_: SIMD3<Scalar>) -> Scalar
  @inlinable static func magnitude(_: SIMD4<Scalar>) -> Scalar

  // MARK: - mix
  @inlinable static func mix(_: SIMD2<Scalar>, _: SIMD2<Scalar>, mix: Scalar) -> SIMD2<Scalar>
  @inlinable static func mix(_: SIMD2<Scalar>, _: SIMD2<Scalar>, mix: SIMD2<Scalar>) -> SIMD2<Scalar>
  @inlinable static func mix(_: SIMD3<Scalar>, _: SIMD3<Scalar>, mix: Scalar) -> SIMD3<Scalar>
  @inlinable static func mix(_: SIMD3<Scalar>, _: SIMD3<Scalar>, mix: SIMD3<Scalar>) -> SIMD3<Scalar>
  @inlinable static func mix(_: SIMD4<Scalar>, _: SIMD4<Scalar>, mix: Scalar) -> SIMD4<Scalar>
  @inlinable static func mix(_: SIMD4<Scalar>, _: SIMD4<Scalar>, mix: SIMD4<Scalar>) -> SIMD4<Scalar>

  // MARK: - normalize
  @inlinable static func normalize(_: SIMD2<Scalar>) -> SIMD2<Scalar>
  @inlinable static func normalize(_: SIMD3<Scalar>) -> SIMD3<Scalar>
  @inlinable static func normalize(_: SIMD4<Scalar>) -> SIMD4<Scalar>
}
