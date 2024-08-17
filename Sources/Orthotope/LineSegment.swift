/// A 1D `Orthotope`.
public struct LineSegment<Scalar: SIMDScalar & FloatingPoint & Sendable> {
  // MARK: - OrthotopeProtocol
  @inlinable public init(origin: Scalar, size: Scalar) {
    self.origin = origin
    self.size = size
  }

  public var origin: Scalar
  public var size: Scalar
}

// MARK: - OrthotopeProtocol
extension LineSegment: OrthotopeProtocol {
  // MARK: - Properties
  @inlinable public var standardized: Self {
    var lineSegment = self
    if size < 0 {
      lineSegment.origin += size
      lineSegment.size.negate()
    }
    return lineSegment
  }

  @inlinable public var boundingRadius: Vector { standardized.size / 2 }

  @inlinable public var center: Vector { origin + size / 2 }

  @inlinable public var max: Vector {
    let standardized = standardized
    return standardized.origin + standardized.size
  }

  @inlinable public var points: Set<Vector> { [min, max] }
}
