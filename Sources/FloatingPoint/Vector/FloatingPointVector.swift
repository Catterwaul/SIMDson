/// - Remark: shift-option-9 is the standard `·`, which is too small.
/// This is option-8 instead.
infix operator •: MultiplicationPrecedence

/// A "`SIMD`" with a scalar type that is used by matrices.
public protocol FloatingPointVector: SIMD where Scalar: FloatingPointScalar {
  /// The dot product.
  /// - Remark: shift-option-9 is the standard `·`, which is too small.
  /// This is option-8 instead.
  @inlinable static func • (_: Self, _: Self) -> Scalar

  /// A unit vector pointing in the same direction.
  @inlinable var normalized: Self { get }
  
  /// "Magnitude" and "length" are synonymous.
  @inlinable var magnitude: Scalar { get set }
}
