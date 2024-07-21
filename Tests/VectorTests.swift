import SIMDson
import Testing

struct VectorTests {
  @Test func isBetween() {
    test(Float.self)
    test(Double.self)

    func test<Scalar: FloatingPointScalar>(_: Scalar.Type) {
      typealias Vector2 = SIMD2<Scalar>
      #expect(Vector2.one.isBetween([1, 0], and: [0, 1]))
      #expect(!(-Vector2.one).isBetween([1, 0], and: [0, 1]))
      #expect(Vector2.one.isBetween([0, 1], and: [1, 0]))
      #expect(!(Vector2.one).isBetween([0, 1], and: [-1, 0]))

      typealias Vector3 = SIMD3<Scalar>
      #expect(Vector3.one.isBetween([1, 0, 0], and: [0, 1, 0]))
      #expect(!(-Vector3.one).isBetween([1, 0, 0], and: [0, 1, 0]))
      #expect(Vector3.one.isBetween([0, 1, 0], and: [1, 0, 0]))
      #expect(!(Vector3.one).isBetween([0, 1, 0], and: [-1, 0, 0]))
    }
  }
}
