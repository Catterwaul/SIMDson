/// A "`SIMD`" with a scalar type that is used by matrices.
public protocol FloatingPointVector: SIMD where Scalar: FloatingPointScalar {
  /// A unit vector pointing in the same direction.
  @inlinable var normalized: Self { get }
}
