//
//  AndroidDriverTests.swift
//  
//
//  Created by 张鹏 on 2021/6/30.
//

import XCTest
@testable import AppiumSwiftClient

class AndroidDriverTests: XCTestCase {
    
    var driver: AndroidDriver!

    override func setUp() {
        let packageRootPath = URL(
            fileURLWithPath: #file.replacingOccurrences(of: "AppiumTests/AndroidDriver/AndroidDriverTests.swift", with: "")
            ).path

        let opts = [
            DesiredCapabilities.platformName: "Android",
            DesiredCapabilities.automationName: "UiAutomator2",
            DesiredCapabilities.app: "\(packageRootPath)/AppiumTests/app/demo-debug.apk.zip",
            DesiredCapabilities.platformVersion: "11",
            DesiredCapabilities.deviceName: "Android Emulator",
            DesiredCapabilities.reduceMotion: "true"
        ]
        do {
            driver = try AndroidDriver(AppiumCapabilities(opts))
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
//        do {
//            let settings = try driver.getSettings().get()
//            let mjpegServerFramerateBefore = settings.mjpegServerFramerate
//            driver.setMjpegServerFramerate(to: 30)
//            let settingsAfter = try driver.getSettings().get()
//            let mjpegServerFramerateAfter = settingsAfter.mjpegServerFramerate
//            XCTAssertNotEqual(mjpegServerFramerateBefore, mjpegServerFramerateAfter)
//        } catch let error {
//            XCTFail("\(error)")
//        }
    }

    func testCanGetSyslog() {
        do {
            let syslog = try driver.getLogcat().get()
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

