import CoreGraphics

public extension Rectangle where Vector == SIMD2<CGFloat.NativeType> {
  /// Convert from `CGRect` to `Rectangle<Double>`.
  @inlinable init(_ rectangle: CGRect) {
    self.init(origin: Vector(rectangle.origin), size: .init(rectangle.size))
  }
}

public extension CGRect {
  /// Convert from `Rectangle<Double>` to `CGRect`.
  @inlinable init(_ rectangle: Rectangle<CGFloat.NativeType>) {
    self.init(origin: .init(rectangle.origin), size: .init(rectangle.size))
  }
}
