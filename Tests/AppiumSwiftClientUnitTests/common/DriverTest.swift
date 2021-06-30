//
//  DriverTest.swift
//  AppiumSwiftClientUnitTests
//
//  Created by kazuaki matsuo on 2018/11/09.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import XCTest
import Mockingjay

@testable import AppiumSwiftClient

class DriverTest : XCTestCase {
    func skip_testDriverInitialization() {
        let expected = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "xcuitest",
            DesiredCapabilities.app: "path/to/test",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone",
            DesiredCapabilities.sessionId: "session id"
        ]

        let opts = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "xcuitest",
            DesiredCapabilities.app: "path/to/test",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone",
        ]
        let driver = try! AppiumDriver(AppiumCapabilities(opts))

        XCTAssertEqual(expected,
                       driver.currentSessionCapabilities.capabilities())
    }

    func skip_testFailedToDriverInitialization() {
        let expected = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "xcuitest",
            DesiredCapabilities.app: "path/to/test",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone",
            DesiredCapabilities.sessionId: "session failed"
        ]

        let opts = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "xcuitest",
            DesiredCapabilities.app: "path/to/test",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone",
        ]
        let driver = try! AppiumDriver(AppiumCapabilities(opts))

        XCTAssertNotEqual(expected,
                          driver.currentSessionCapabilities.capabilities())
    }
}
