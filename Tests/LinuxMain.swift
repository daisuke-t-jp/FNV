import XCTest

import FNVTests

var tests = [XCTestCaseEntry]()
tests += FNVTests.allTests()
XCTMain(tests)
