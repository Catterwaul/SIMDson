import Algorithms

public extension SIMD where Scalar: SIMDScalar {
  /// Swizzle the vector. `xy` by default.
  ///
  /// - Note: Acts as a default for the subscript that accesses elements based on a `SIMD2<Index>`,
  ///   and adds write capability to it.
  subscript(index0: Int = 0, index1: Int = 1) -> SIMD2<Scalar> {
    get { self[[index0, index1]] }
    set {
      for index in [index0, index1].indexed() {
        self[index.element] = newValue[index.index]
      }
    }
  }

  /// Swizzle the vector. `xyz` by default.
  ///
  /// - Note: Acts as a default for the subscript that accesses elements based on a `SIMD3<Index>`,
  ///   and adds write capability to it.
  subscript(index0: Int = 0, index1: Int = 1, index2: Int = 2) -> SIMD3<Scalar> {
    get { self[[index0, index1, index2]] }
    set {
      for index in [index0, index1, index2].indexed() {
        self[index.element] = newValue[index.index]
      }
    }
  }
}
