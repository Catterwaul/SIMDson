import Spatial

public extension Matrix3x3 {
  init(_ rotation: Rotation3D) {
    self.init(rotation.quaternion)
  }
}
