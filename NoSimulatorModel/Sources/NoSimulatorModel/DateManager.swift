//
//  DateManager.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation

public protocol DateManager {
    func now() -> Date
}

public class DefaultDateManager: DateManager {
    
    private let dateFactory: DateFactory
    
    public init(dateFactory: DateFactory = DefaultDateFactory()) {
        self.dateFactory = dateFactory
    }
    
    public func now() -> Date {
        return dateFactory.now()
    }
}

