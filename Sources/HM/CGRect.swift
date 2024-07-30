import CoreGraphics

public extension CGRect {
  // MARK: - Initializers

  init(
    x: CGFloat, y: CGFloat,
    size: some CommonOperable<SIMD2<CGFloat.NativeType>>
  ) {
    self.init(
      origin: CGPoint(x: x, y: y),
      size: CGSize(size)
    )
  }
}
