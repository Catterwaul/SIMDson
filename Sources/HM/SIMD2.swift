import Algorithms
import CoreGraphics
import simd

public extension SIMD2 {
  init(_ scalars: (Scalar, Scalar)) {
    self.init(scalars.0, scalars.1)
  }

  init(_ float2: some CommonVectorOperable<Self>) {
    self = float2.convertedToOperand
  }
}

public extension SIMD2<CGFloat.NativeType> {
// MARK: - Initializers
  init(_ x: CGFloat, _ y: CGFloat) {
    self.init(x.native, y.native)
  }

// MARK: - Methods

  func clamped(within bounds: CGRect) -> Self {
    simd.clamp(
      self,
      min: Self(bounds.minX, bounds.minY),
      max: Self(bounds.maxX, bounds.maxY)
    )
  }

  /// Distance to the closest point on the rectangle's boundary.
  /// - Note: Negative if inside the rectangle.
  func signedDistance(to rect: CGRect) -> Scalar {
    let distances =
      abs(self - Self(rect.center))
      - Self(rect.size) / 2
    return
      all(sign(distances) .> 0)
      ? length(distances)
      : distances.max()
  }
}
