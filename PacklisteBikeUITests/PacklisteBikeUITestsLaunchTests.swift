//
//  PacklisteBikeUITestsLaunchTests.swift
//  PacklisteBikeUITests
//
//  Created by Fabio Cappellaro on 12.03.25.
//

import XCTest

final class PacklisteBikeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()


        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
