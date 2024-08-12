import SIMDson
import Testing
import Tuplé

struct SIMDTests {
  @Test func directions() {
    #expect(SIMD2<Float>.up == [0, 1])
    #expect(SIMD3<Int>.down == [0, -1, 0])
    #expect(SIMD4<Double>.left == [-1, 0, 0, 0])
    #expect(SIMD3<Double>.right == [1, 0, 0])
  }

  @Test func tuple() {
    #expect(map(SIMD2(1, 2).tuple)(-) == (-1, -2))
    #expect(map(SIMD3<Float>(1, 2, 3).tuple)(-) == (-1, -2, -3))
    #expect(map(SIMD4<Double>(1, 2, 3, 4).tuple)(-) == (-1, -2, -3, -4))
  }
}
