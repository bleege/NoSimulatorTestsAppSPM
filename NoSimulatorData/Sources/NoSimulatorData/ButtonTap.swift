//
//  ButtonTap.swift
//  NoSimulatorData
//
//  Created by Brad Leege on 1/1/25.
//

import Foundation

public struct ButtonTap: Codable {
    
    public let id: UUID
    public let dateTapped: Date
    
    public init(id: UUID, dateTapped: Date) {
        self.id = id
        self.dateTapped = dateTapped
    }
    
}
