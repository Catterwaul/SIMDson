import SIMDson
import Testing

struct NormalizedTests {
  @Test func test() {
    test(SIMD2<Double>.self)
    test(SIMD3<Double>.self)
    test(SIMD4<Double>.self)
    test(SIMD2<Float>.self)
    test(SIMD3<Float>.self)
    test(SIMD4<Float>.self)

    func test<Vector: FloatingPointVector>(_: Vector.Type) {
      let unnormalized = Vector.one
      let normalized = unnormalized.normalized
      test(wrapped: unnormalized, $projected: unnormalized)

      func test(
        @Normalized wrapped: Vector, // Using a default for `init(wrappedValue:)` crashes the compiler.
        @Normalized projected: Vector // Using a default for `init(projectedValue:)` doesn't make sense, syntactically.
      ) {
        #expect(wrapped == unnormalized)
        #expect($wrapped == normalized)
        #expect(wrapped == normalized)

        #expect(projected == normalized)
        $projected = unnormalized
        #expect(projected == normalized)
      }
    }
  }
}
