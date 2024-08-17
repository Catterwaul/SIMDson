import CoreGraphics

public extension SIMD2 where Scalar == CGFloat.NativeType {
  /// Convert from `CGPoint` to `SIMD2<Double>`.
  @inlinable init(_ point: CGPoint) {
    self.init(x: point.x, y: point.y)
  }

  /// Convert from `CGVector` to `SIMD2<Double>`.
  @inlinable init(_ vector: CGVector) {
    self.init(x: vector.dx, y: vector.dy)
  }

  /// Convert from `CGSize` to `SIMD2<Double>`.
  @inlinable init(_ size: CGSize) {
    self.init(x: size.width, y: size.height)
  }
}

public extension CGPoint {
  /// Convert from `SIMD2<Double>` to `CGPoint` .
  @inlinable init(_ point: SIMD2<CGFloat.NativeType>) {
    self.init(x: point.x, y: point.y)
  }
}

public extension CGVector {
  /// Convert from `SIMD2<Double>` to `CGVector` .
  @inlinable init(_ vector: SIMD2<CGFloat.NativeType>) {
    self.init(dx: vector.x, dy: vector.y)
  }
}

public extension CGSize {
  /// Convert from `SIMD2<Double>` to `CGSize` .
  @inlinable init(_ size: SIMD2<CGFloat.NativeType>) {
    self.init(width: size.x, height: size.y)
  }
}
