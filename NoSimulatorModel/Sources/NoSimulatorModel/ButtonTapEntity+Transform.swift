//
//  ButtonTapEntity+Transform.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 1/1/25.
//

import CoreData
import Foundation
import NoSimulatorData

extension ButtonTapEntity {
    
    var dataObject: ButtonTap? {
        guard let id, let dateTapped else { return nil }
        return ButtonTap(id: id, dateTapped: dateTapped)
    }
    
}

extension ButtonTap {

    func toEntityObject(_ context: NSManagedObjectContext) -> ButtonTapEntity {
        let entityObject = ButtonTapEntity(context: context)
        entityObject.setValue(id, forKey: "id")
        entityObject.setValue(dateTapped, forKey: "dateTapped")
        return entityObject
    }
    
}
