//
//  CoreDataManager.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/11/24.
//

import Foundation
import CoreData
import NoSimulatorData

public protocol CoreDataManager {
    func saveButtonTap(date: Date) throws
    func loadAllButtonTaps() throws -> [ButtonTap]
}

public class DefaultCoreDataManager: CoreDataManager {
    
    private let persistentContainer: NSPersistentContainer
        
    public init (_ persistentContainer: NSPersistentContainer = CoreDataContainer()) {
        self.persistentContainer = persistentContainer
    }
        
    public func saveButtonTap(date: Date) throws {
        
        let context = persistentContainer.viewContext
        
        do {
            let buttonTap = ButtonTapEntity(context: context)
            buttonTap.id = UUID()
            buttonTap.dateTapped = date

            try context.save()
        } catch {
            print("Error saving button tap: \(error)")
            throw ModelErrors.generic("Error saving button tap.")
        }
        
    }
    
    public func loadAllButtonTaps() throws -> [ButtonTap] {

        let context = persistentContainer.viewContext

        let request: NSFetchRequest<ButtonTapEntity> = ButtonTapEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            key: #keyPath(
                ButtonTapEntity.dateTapped
            ),
            ascending: false
        )]
        
        do {
            let buttonTaps = try context.fetch(request)
            return buttonTaps.compactMap { $0.dataObject }
        } catch {
            print("Error fetching button taps: \(error)")
            throw ModelErrors.generic("Error fetching button taps.")
        }
    }
}
