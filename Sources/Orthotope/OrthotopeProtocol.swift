/// An origin and axis-aligned size.
///
/// An orthotope is a line segment, when  `Vector` is 1-dimensional.
/// Higher dimensions will [extrude](https://en.wikipedia.org/wiki/Extrusion)
/// that line segment into higher dimensions, always at right angles,
/// to align with the additional axes.
///
/// 1D orthotopes are represented with the `LineSegment` structure.
/// Specialized `Orthotope` type aliases are provided for the next two dimensions:
/// * 2D: "`Rectangle`"
/// * 3D: "`RectangularCuboid`"
///
/// Higher-dimensional orthotopes are known as "[hyperrectangles](https://en.wikipedia.org/wiki/Hyperrectangle)".
///
/// This protocol is a mechanism for providing the same interface for `LineSegment` and higher dimensions of `Orthotope`.
public protocol OrthotopeProtocol<Vector>: Hashable & Sendable {
  associatedtype Vector
  associatedtype Scalar

  @inlinable init(origin: Vector, size: Vector)

  // MARK: - Properties
  @inlinable var origin: Vector { get set }

  /// The signed size (each dimension can be negative).
  @inlinable var size: Vector { get set }

  /// An orthotope with only positive size.
  ///
  /// If any of the dimensions of `size` are negative,
  /// this will shift the origin by that value, and invert the corresponding size dimension.
  @inlinable var standardized: Self { get }

  /// The radius of a sphere that encompasses this orthotope.
  @inlinable var boundingRadius: Scalar { get }

  @inlinable var center: Vector { get }

  /// The `origin + size` of the standardized orthotope.
  @inlinable var max: Vector { get }
}

public extension OrthotopeProtocol {
  /// The origin of the standardized orthotope.
  @inlinable var min: Vector { standardized.origin }
}
