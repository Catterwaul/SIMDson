protocol FloatingPointScalar: SIMDScalar & BinaryFloatingPoint & Codable {
  associatedtype Matrix2x2: Matrix2x2Protocol
}

protocol FloatingPointVector: SIMD where Scalar: FloatingPointScalar {
  // Uncomment this to crash the compiler.
//  associatedtype Matrix2
}

extension SIMD2: FloatingPointVector where Scalar: FloatingPointScalar {
  typealias Matrix2 = Scalar.Matrix2x2
}

protocol SquareMatrix {
  associatedtype Scalar
  associatedtype Vector: FloatingPointVector
}

protocol Matrix2x2Protocol: SquareMatrix where Vector == SIMD2<Scalar> {
//   I want to use `Vector.Matrix2` here.
//  static var test: Vector.Matrix2 { get }
}
