public extension SIMD where Scalar: Numeric {
  var squareMagnitude: Scalar { dot(self) }
  
  /// The dot product.
  func dot(_ vector: Self) -> Scalar {
    indices.lazy.map { self[$0] * vector[$0] }.sum!
  }
}

public extension SIMD where Scalar: FixedWidthInteger, Self: Sendable {
  static func ...(vector0: Self, vector1: Self) -> some Sequence<Self> {
    sequence(first: vector0) {
      guard $0 != vector1 else { return nil }

      return $0 &+ (vector1 &- $0).clamped(
        lowerBound: .init(repeating: -1),
        upperBound: .init(repeating: 1)
      )
    }
  }
}

public extension SIMD where Scalar: FloatingPoint {
  /// Convert integers to floating point vectors.
  init<Integer: BinaryInteger>(_ integers: Integer...) {
    self.init(integers.map(Scalar.init))
  }
}
