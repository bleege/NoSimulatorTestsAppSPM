//
//  ButtonTapEntity+CoreDataProperties.swift
//  NoSimulatorTestsAppSPM
//
//  Created by Brad Leege on 11/20/24.
//
//

import Foundation
import CoreData


extension ButtonTapEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ButtonTapEntity> {
        return NSFetchRequest<ButtonTapEntity>(entityName: "ButtonTapEntity")
    }

    @NSManaged public var dateTapped: Date?
    @NSManaged public var id: UUID?

}
