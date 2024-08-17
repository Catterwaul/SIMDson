import typealias CoreGraphics.CGRect
import SIMDson
import Testing

struct OrthotopeTests {
  @Test func lineSegment() {
    let lineSegment = LineSegment(origin: 1, size: -3)
    #expect(lineSegment.min == -2)
    #expect(lineSegment.center == -0.5)
    #expect(lineSegment.max == 1)
    #expect(lineSegment.boundingRadius == 1.5)
    #expect(lineSegment.standardized == .init(origin: -2, size: 3))
    #expect(lineSegment.points == [-2, 1])
  }

  @Test func rectangle() {
    let size = [3.0, 4] as SIMD2
    let rectangle = Rectangle(origin: .one as SIMD2, size: -size)
    #expect(rectangle.min == -[2, 3])
    #expect(rectangle.center == -[0.5, 1])
    #expect(rectangle.max == .one)
    #expect(rectangle.boundingRadius == 5.0 / 2)
    #expect(rectangle.standardized == .init(origin: 1 - size, size: size))
  }
}
