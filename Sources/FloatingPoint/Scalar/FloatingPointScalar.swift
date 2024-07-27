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

  // A matrix with 3 columns and 2 rows.
  associatedtype Matrix3x2: SIMDson.Matrix3x2<Self>

  associatedtype Matrix3x3: SIMDson.Matrix3x3<Self>

  associatedtype Matrix4x4: SIMDson.Matrix4x4<Self>
}

public protocol FloatingPointVectorRequirements<Scalar> {
  associatedtype Scalar: FloatingPointScalar

  @inlinable static func cross(_ x: SIMD3<Scalar>, _ y: SIMD3<Scalar>) -> SIMD3<Scalar>

  // MARK: - normalize
  @inlinable static func normalize(_ vector: SIMD2<Scalar>) -> SIMD2<Scalar>
  @inlinable static func normalize(_ vector: SIMD3<Scalar>) -> SIMD3<Scalar>
  @inlinable static func normalize(_ vector: SIMD4<Scalar>) -> SIMD4<Scalar>
}
