//
//  DateFactory.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/9/24.
//

import Foundation

public protocol DateFactory {
    func now() -> Date
}

public class DefaultDateFactory: DateFactory {

    public init() {}
    
    public func now() -> Date {
        return Date()
    }
}

