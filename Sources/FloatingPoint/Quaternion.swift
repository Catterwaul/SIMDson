public protocol Quaternion<Scalar> {
  associatedtype Scalar: FloatingPointScalar

  @inlinable init(vector: SIMD4<Scalar>)
  @inlinable var vector: SIMD4<Scalar> { get }
}

public extension Quaternion {
  @inlinable init(_ quaternion: some Quaternion) {
    self.init(vector: .init(quaternion.vector))
  }
}
