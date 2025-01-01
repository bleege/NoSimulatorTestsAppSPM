import Foundation
import Testing
@testable import NoSimulatorData


struct NoSimulatorDataTests {

    @Test func testButtonTapRoundtrip() async throws {
        
        let id = UUID()
        let date = Date()
        let buttonTap = ButtonTap(id: id, dateTapped: date)

        let encoder = JSONEncoder()
        let encodedButtonTap = try encoder.encode(buttonTap)
        
        #expect(encodedButtonTap != nil)
        
        let decoder = JSONDecoder()
        let decodedButtonTap = try decoder.decode(ButtonTap.self, from: encodedButtonTap)

        #expect(decodedButtonTap.id == id)
        #expect(decodedButtonTap.dateTapped == date)
            
    }
    
}
