//
//  IOSDriverTests.swift
//  AppiumFuncTests
//
//  Created by Gabriel Fioretti on 20.05.20.
//  Copyright © 2020 KazuCocoa. All rights reserved.
//

import XCTest
@testable import AppiumSwiftClient

class IOSDriverTests: XCTestCase {
    var driver: IOSDriver!

    override func setUp() {
        let packageRootPath = URL(
            fileURLWithPath: #file.replacingOccurrences(of: "AppiumTests/iOSDriver/IOSDriverTests.swift", with: "")
            ).path

        let opts = [
            DesiredCapabilities.platformName: "iOS",
            DesiredCapabilities.automationName: "XCUITest",
            DesiredCapabilities.app: "\(packageRootPath)/AppiumTests/app/UICatalog.app.zip",
            DesiredCapabilities.platformVersion: "14.5",
            DesiredCapabilities.deviceName: "iPhone 12",
            DesiredCapabilities.reduceMotion: "true"
        ]
        do {
            driver = try IOSDriver(AppiumCapabilities(opts))
        } catch {
            XCTFail("Failed to spin up driver: \(error)")
        }
    }

    func testGetSettings() {
        do {
            let settings = try driver.getSettings().get()
            XCTAssertNotNil(settings)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testCanSetSetting() {
        do {
            let settings = try driver.getSettings().get()
            let mjpegServerFramerateBefore = settings.mjpegServerFramerate
            driver.setMjpegServerFramerate(to: 30)
            let settingsAfter = try driver.getSettings().get()
            let mjpegServerFramerateAfter = settingsAfter.mjpegServerFramerate
            XCTAssertNotEqual(mjpegServerFramerateBefore, mjpegServerFramerateAfter)
        } catch let error {
            XCTFail("\(error)")
        }
    }

    func testCanGetSyslog() {
        do {
            let syslog = try driver.getSyslog().get()
            XCTAssertFalse(syslog.isEmpty)
        } catch {
            XCTFail("\(error)")
        }
    }

    override func tearDown() {
        do {
            try driver.quit().get()
        } catch {
            XCTFail("Failed to quit driver: \(error)")
        }
    }
}
