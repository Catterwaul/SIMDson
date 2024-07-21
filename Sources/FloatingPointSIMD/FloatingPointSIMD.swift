public protocol FloatingPointSIMD: SIMD where Scalar: FloatingPointSIMDScalar {
  /// A unit vector pointing in the same direction.
  @inlinable var normalized: Self { get }
}
