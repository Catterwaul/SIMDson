import SIMDson
import Testing

struct VectorTests {
  @Test func test() {
    #expect(([1, 1] as SIMD2).isBetween([1, 0], and: [0, 1]))
    #expect(!([-1, -1] as SIMD2).isBetween([1, 0], and: [0, 1]))
    #expect(([1, 1] as SIMD2).isBetween([0, 1], and: [1, 0]))
    #expect(!([1, 1] as SIMD2).isBetween([0, 1], and: [-1, 0]))
  }
}
