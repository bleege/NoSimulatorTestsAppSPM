//
//  ModelRepository.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/16/24.
//

import Foundation

public protocol ModelRepository {
    func now() -> Date

    func saveButtonTap() throws
    func loadAllButtonTaps() throws -> [ButtonTap]
}

public class DefaultModelRepository: ModelRepository {
        
    let coreDataManager: CoreDataManager
    let dateManager: DateManager
    
    public convenience init() {
        self.init(
            coreDataManager: DefaultCoreDataManager(),
            dateManager: DefaultDateManager()
        )
    }
    
    init(
        coreDataManager: CoreDataManager = DefaultCoreDataManager(),
        dateManager: DateManager = DefaultDateManager()
    ) {
        self.coreDataManager = coreDataManager
        self.dateManager = dateManager
    }
    
    public func now() -> Date {
        return dateManager.now()
    }
    
    public func saveButtonTap() throws {
        try coreDataManager.saveButtonTap(date: now())
    }
    
    public func loadAllButtonTaps() throws -> [ButtonTap] {
        return try coreDataManager.loadAllButtonTaps()
    }
    
}
