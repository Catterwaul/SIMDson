import SIMDson
import Testing

struct MatrixTests {
  @Test func conversion() {
    var matrix3x3 = Double.Matrix3x3()
    matrix3x3.columns.0 = [1, 2, 3]
    #expect(Float.Matrix3x3(matrix3x3).columns.0 == [1, 2, 3])

    var matrix4x4 = Double.Matrix4x4()
    matrix4x4.columns.0 = [1, 2, 3, 4]
    #expect(Float.Matrix4x4(matrix4x4).columns.0 == [1, 2, 3, 4])
  }
}
