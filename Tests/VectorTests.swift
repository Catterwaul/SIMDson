import SIMDson
import Testing
import Tuplé

struct VectorTests {
  @Test func `subscript`() {
    var double3 = SIMD3((10...12).map(Double.init))
    var double4 = SIMD4((1...4).map(Double.init))

    #expect(double3[] == [10, 11])
    #expect(double4[] == [1, 2, 3] as SIMD3)

    double4[] += double3
    #expect(double4 == [11, 13, 15, 4])

    double3[] += [0, 1] as SIMD2
    #expect(double3 == [10, 12, 12])

    double3[1, 2] = [-1, -2]
    #expect(double3 == [10, -1, -2])
  }

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
