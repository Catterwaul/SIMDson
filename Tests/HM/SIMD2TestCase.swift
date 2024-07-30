import HM
import XCTest

final class SIMD2TestCase: XCTestCase {
  func test_range() {
    XCTAssertEqual(
      Array(SIMD2(0, 2)..<[-2, 3]),
      [[0, 2], [-1, 3]]
    )
  }
}
