//
//  CoreDataManagerTests.swift
//  NoSimulatorModelTests
//
//  Created by Brad Leege on 11/15/24.
//

import Foundation
import Testing
import NoSimulatorModel

struct CoreDataManagerTests {

    @Test func testLoadAllButtonTaps() async throws {
        let testSubject = DefaultCoreDataManager(CoreDataContainer(true))
        
        let firstDateComponents = DateComponents(year: 2024, month: 7, day: 4)
        let firstDate = Calendar.current.date(from: firstDateComponents)!
        try testSubject.saveButtonTap(date: firstDate)
        
        let secondDateComponents = DateComponents(year: 2023, month: 4, day: 24)
        let secondDate = Calendar.current.date(from: secondDateComponents)!
        try testSubject.saveButtonTap(date: secondDate)
        
        let thirdDateComponents = DateComponents(year: 2024, month: 10, day: 7)
        let thirdDate = Calendar.current.date(from: thirdDateComponents)!
        try testSubject.saveButtonTap(date: thirdDate)

        let buttonTaps = try testSubject.loadAllButtonTaps()
        
        #expect(buttonTaps.count == 3)
        #expect(buttonTaps[0].dateTapped == thirdDate)
        #expect(buttonTaps[1].dateTapped == firstDate)
        #expect(buttonTaps[2].dateTapped == secondDate)
    }

}
