extension SIMD3: FloatingPointVector where Scalar: FloatingPointScalar {
  @inlinable public var normalized: Self { Scalar.normalize(self) }
}

// MARK: - public
public extension SIMD3 where Self: FloatingPointVector {
  /// Whether a vector points somewhere between two others.
  ///
  /// The vector that calls this method is projected into the 2D coordinate space
  /// defined by the basis vectors `vector0` and `vector1`.
  /// The return value is whether the result is positive in both dimensions.
  @inlinable func isBetween(_ vector0: Self, and vector1: Self) -> Bool {
    let projectedTo2D = Scalar.Matrix3x2(
      Scalar.Matrix3x3(vector0, vector1).inverse
    ) * self
    return all(projectedTo2D .>= 0)
  }
}
