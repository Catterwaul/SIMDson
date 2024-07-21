import SIMDson
import Testing

struct VectorTests {
  @Test func isBetween() {
    #expect(SIMD2.one.isBetween([1, 0], and: [0, 1]))
    #expect(!(-SIMD2.one).isBetween([1, 0], and: [0, 1]))
    #expect(SIMD2.one.isBetween([0, 1], and: [1, 0]))
    #expect(!(SIMD2.one).isBetween([0, 1], and: [-1, 0]))

    #expect(SIMD3.one.isBetween([1, 0, 0], and: [0, 1, 0]))
    #expect(!(-SIMD3.one).isBetween([1, 0, 0], and: [0, 1, 0]))
    #expect(SIMD3.one.isBetween([0, 1, 0], and: [1, 0, 0]))
    #expect(!(SIMD3.one).isBetween([0, 1, 0], and: [-1, 0, 0]))
  }
}
