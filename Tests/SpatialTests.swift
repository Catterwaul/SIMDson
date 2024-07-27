import SIMDson
import Spatial
import Testing

struct SpatialTests {
  @Test func rotationConversion() {
    #expect(Float.Matrix3x3(Rotation3D.identity) == .init(1))
  }
}
