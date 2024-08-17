import SIMDson
import Testing
import Tuplé

struct VectorTests {
  @Test func dot() {
    func test<Vector: FloatingPointVector>(_: Vector.Type) {
      #expect(Vector.left • .right == -1)
    }
    test(Self.allVectorTypes)
    func test<each Vector: FloatingPointVector>(_: (repeat (each Vector).Type)) {
      repeat test((each Vector).self)
    }
  }

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

  @Test func magnitude() {
    func test<Vector: FloatingPointVector>(_: Vector.Type) {
      var vector = Vector.up * 2
      #expect(vector.magnitude == 2)
      vector.magnitude = 3
      #expect(vector[1] == 3)
    }
    test(Self.allVectorTypes)
    func test<each Vector: FloatingPointVector>(_: (repeat (each Vector).Type)) {
      repeat test((each Vector).self)
    }
  }

  @Test func mix() {
    func test<Vector: FloatingPointVector>(_: Vector.Type) {
      #expect(.mix(.up, .down, mix: 0.5) == Vector.zero)
      #expect(.mix(.up, .down, mix: .one / 2) == Vector.zero)
    }
    test(Self.allVectorTypes)
    func test<each Vector: FloatingPointVector>(_: (repeat (each Vector).Type)) {
      repeat test((each Vector).self)
    }
  }

  @Test func normalized() {
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
    test(Self.allVectorTypes)
    func test<each Vector: FloatingPointVector>(_: (repeat (each Vector).Type)) {
      repeat test((each Vector).self)
    }
  }
}

private extension VectorTests {
  static let allScalarTypes = (Float.self, Double.self)
  static let allVectorTypes = flattened(map(allScalarTypes, transforms: allVectorTypes, allVectorTypes))

  private static func allVectorTypes<Scalar: FloatingPointScalar>(_: Scalar.Type)
  -> (SIMD2<Scalar>.Type, SIMD3<Scalar>.Type, SIMD4<Scalar>.Type) {
    (SIMD2.self, SIMD3.self, SIMD4.self)
  }
}
