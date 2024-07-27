import SIMDson
import Testing

struct SIMDTests {
  @Test func directions() {
    #expect(SIMD2<Float>.up == [0, 1])
    #expect(SIMD3<Int>.down == [0, -1, 0])
    #expect(SIMD4<Double>.left == [-1, 0, 0, 0])
    #expect(SIMD3<Double>.right == [1, 0, 0])
  }
}
