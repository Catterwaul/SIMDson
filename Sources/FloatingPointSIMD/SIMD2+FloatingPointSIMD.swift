extension SIMD2: FloatingPointSIMD where Scalar: FloatingPointSIMDScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}
