extension SIMD4: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}
