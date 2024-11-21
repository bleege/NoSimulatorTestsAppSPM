//
//  ButtonTap+CoreDataProperties.swift
//  NoSimulatorTestsAppSPM
//
//  Created by Brad Leege on 11/20/24.
//
//

import Foundation
import CoreData


extension ButtonTap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ButtonTap> {
        return NSFetchRequest<ButtonTap>(entityName: "ButtonTap")
    }

    @NSManaged public var dateTapped: Date?
    @NSManaged public var id: UUID?

}
