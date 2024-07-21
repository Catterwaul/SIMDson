// MARK: FloatingPointVector
extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}
