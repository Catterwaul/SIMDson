/// - Remark: shift-option-9 is the standard `·`, which is too small.
/// This is option-8 instead.
infix operator •: MultiplicationPrecedence

/// A "`SIMD`" with a scalar type that is used by matrices.
public protocol FloatingPointVector<Scalar>: SIMD where Scalar: FloatingPointScalar {
  /// The dot product.
  /// - Remark: shift-option-9 is the standard `·`, which is too small.
  /// This is option-8 instead.
  @inlinable static func • (_: Self, _: Self) -> Scalar

  /// Linearly interpolate between two vectors with a scalar.
  /// - Parameters:
  ///   - vector0: The value returned when mix is `0`.
  ///   - vector1: The value returned when mix is `1`.
  ///   - mix: is not clamped to the 0-1 range.
  @inlinable static func mix(_ vector0: Self, _ vector1: Self, mix: Scalar) -> Self

  /// Linearly interpolate between two vectors with another vector.
  /// - Parameters:
  ///   - vector0: The value returned when mix is `0`.
  ///   - vector1: The value returned when mix is `1`.
  ///   - mix: is not clamped to the 0-1 range.
  @inlinable static func mix(_ vector0: Self, _ vector1: Self, mix: Self) -> Self

  /// A unit vector pointing in the same direction.
  @inlinable var normalized: Self { get }
  
  /// "Magnitude" and "length" are synonymous.
  @inlinable var magnitude: Scalar { get set }
}
