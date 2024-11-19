//
//  NoSimulatorModelTests.swift
//  NoSimulatorModelTests
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation
import Testing
import NoSimulatorModel

struct DateManagerTests {

    @Test func testNowFunction() async throws {
        let dateFactory = DateFactoryMock()
        let date = Date()
        dateFactory.dateCallback = {
            date
        }
        
        let dateManager = DefaultDateManager(dateFactory: dateFactory)
        
        #expect(dateManager.now() == date)
    }

}

extension DateManagerTests {
    class DateFactoryMock: DateFactory {
        var dateCallback: (() -> Date)?

        func now() -> Date {
            dateCallback!()
        }
    }
}
