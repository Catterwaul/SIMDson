import CoreGraphics
import SIMDson
import Testing

extension OrthotopeTests {
  struct CoreGraphics {
    @Test func vectorConversion() {
      let simd = SIMD2<Double>(x: 1, y: 2)

      let point = CGPoint(x: 1, y: 2)
      #expect(simd == .init(point))
      #expect(point == .init(simd))

      let vector = CGVector(dx: 1, dy: 2)
      #expect(simd == .init(vector))
      #expect(vector == .init(simd))

      let size = CGSize(width: 1, height: 2)
      #expect(simd == .init(size))
      #expect(size == .init(simd))
    }
  }

  @Test func rectangleConversion() {
    let rectangle = Rectangle(origin: .one as SIMD2, size: -[3, 3])
    let rect = CGRect(rectangle)
    #expect(rectangle == .init(rect))
    #expect(rect == .init(rectangle))
  }
}
