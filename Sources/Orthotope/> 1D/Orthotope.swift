import Algorithms

/// A multi-dimensional `Orthotope`.
public struct Orthotope<Vector: FloatingPointVector & Hashable & Sendable> {
  // MARK: - OrthotopeProtocol
  @inlinable public init(origin: Vector, size: Vector) {
    self.origin = origin
    self.size = size
  }

  public var origin: Vector
  
  /// The signed size (each dimension can be negative).
  public var size: Vector
}

// MARK: - Hashable (& Equatable)
extension Orthotope: Hashable { }

// MARK: - OrthotopeProtocol
extension Orthotope: OrthotopeProtocol {
  public typealias Scalar = Vector.Scalar

  // MARK: - Properties
  @inlinable public var standardized: Self {
    let mask = size .< 0
    return .init(
      origin: origin.replacing(with: origin + size, where: mask),
      size: size.replacing(with: -size, where: mask)
    )
  }

  @inlinable public var boundingRadius: Scalar { (size / 2).magnitude }

  @inlinable public var center: Vector { origin + size / 2 }

  @inlinable public var max: Vector {
    let standardized = standardized
    return standardized.origin + standardized.size
  }
}
