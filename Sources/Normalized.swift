/// A unit vector.
///
/// Setting `wrappedValue` contractually guarantees that you're providing a normalized vector.
/// If you want to normalize a value that may not be normalized already, use `projectedValue` instead.
/// `wrappedValue` will be normalized after you either set, ***or get***,  `projectedValue`.
@propertyWrapper public struct Normalized<Vector: FloatingPointSIMD> {
  public var wrappedValue: Vector

  /// - Precondition: `wrappedValue` is normalized.
  @inlinable public init(wrappedValue: Vector) {
    self.wrappedValue = wrappedValue
  }

  /// Normalize a vector that may not be already.
  @inlinable public init(projectedValue: Vector) {
    wrappedValue = projectedValue.normalized
  }

  /// Get a normalized vector or set one that may not be normalized.
  ///
  /// If you don't know if what you've set to `wrappedValue` is normalized, for some reason,
  /// you can `get` this instead. Doing so will also normalize `wrappedValue`.
  ///
  /// Usually, you'll only be making use of `set`, which sets `wrappedValue` to a normalized version of the new value.
  @inlinable public var projectedValue: Vector {
    mutating get {
      wrappedValue = wrappedValue.normalized
      return wrappedValue
    }
    set { wrappedValue = newValue.normalized }
  }
}
