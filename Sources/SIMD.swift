import Algorithms

public extension SIMD where Self: RandomAccessCollection {
  var startIndex: Int { 0 }
  var endIndex: Int { scalarCount }
}

extension SIMD2: @retroactive RandomAccessCollection { }
extension SIMD3: @retroactive RandomAccessCollection { }
extension SIMD4: @retroactive RandomAccessCollection { }
extension SIMD8: @retroactive RandomAccessCollection { }
extension SIMD16: @retroactive RandomAccessCollection { }
extension SIMD32: @retroactive RandomAccessCollection { }
extension SIMD64: @retroactive RandomAccessCollection { }

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

public extension SIMD where Scalar: SIMDScalar & ExpressibleByIntegerLiteral {
  init(_ vector: SIMD2<Scalar>) {
    self.init()
    self[] = vector
  }
}

public extension SIMD where Scalar: SIMDScalar & SignedNumeric {
  static var up: Self { .init([0, 1] as SIMD2) }
  static var down: Self { .init([0, -1] as SIMD2) }
  static var left: Self { .init([-1, 0] as SIMD2) }
  static var right: Self { .init([1, 0] as SIMD2) }
}


// MARK: - tuple
public extension SIMD2 {
  /// A labeled `Vectuple2`.
  typealias Tuple<Element> = (x: Element, y: Element)

  /// A tuple of this vector's scalars.
  @inlinable var tuple: Tuple<Scalar> { (x, y) }
}

public extension SIMD3 {
  /// A labeled `Vectuple3`.
  typealias Tuple<Element> = (x: Element, y: Element, z: Element)

  /// A tuple of this vector's scalars.
  @inlinable var tuple: (x: Scalar, y: Scalar, z: Scalar) { (x, y, z) }
}

public extension SIMD4 {
  /// A labeled `Vectuple4`.
  typealias Tuple<Element> = (x: Element, y: Element, z: Element, w: Element)

  /// A tuple of this vector's scalars.
  @inlinable var tuple: Tuple<Scalar> { (x, y, z, w) }

  /// A `SIMD4` created by appending two scalars to a `SIMD2`.
  init(_ xy: SIMD2<Scalar>, _ z: Scalar, _ w: Scalar) {
    self.init(xy.x, xy.y, z, w)
  }

  /// A `SIMD4` created by appending one `SIMD2` to another.
  init(_ xy: SIMD2<Scalar>, _ zw: SIMD2<Scalar>) {
    self.init(lowHalf: xy, highHalf: zw)
  }
}
