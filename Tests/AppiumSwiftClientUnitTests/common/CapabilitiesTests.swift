//
//  CapabilitiesTests.swift
//  AppiumSwiftClientUnitTests
//
//  Created by kazuaki matsuo on 2018/11/09.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import XCTest
import AppiumSwiftClient

class CapabilitiesTest : XCTestCase {
    func testDefineCapabilities() {
        let opts = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "xcuitest",
            DesiredCapabilities.app: "path/to/test",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone Simulator",
        ]
        let caps = AppiumCapabilities(opts)
        XCTAssertEqual("iOS", caps.capabilities()[.platformName])
    }
}