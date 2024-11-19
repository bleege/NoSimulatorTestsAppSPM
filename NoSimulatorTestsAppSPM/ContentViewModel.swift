//
//  ContentViewModel.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation
import NoSimulatorModel

struct ButtonTapData: Identifiable {
    let id: UUID
    let tapDate: Date
}

class DefaultContentViewModel: ContentViewModel {
    @Published var buttonTaps = [ButtonTapData]()
    
    private let modelRepository: ModelRepository
    
    init(
        modelRepository: ModelRepository = DefaultModelRepository()
    ) {
        self.modelRepository = modelRepository
    }
    
    func handleNowButtonTapped() {
        do {
            try modelRepository.saveButtonTap()
            try loadButtonTaps()
        } catch {
            print("Error saving button tap: \(error.localizedDescription)")
        }
    }
    
    func handleOnAppear() {
        do {
            try loadButtonTaps()
        } catch {
            print("Error loading button taps: \(error.localizedDescription)")
        }
    }
    
    private func loadButtonTaps() throws {
        buttonTaps = try modelRepository.loadAllButtonTaps().compactMap {
            guard let id = $0.id, let tapDate = $0.dateTapped else {
                return nil
            }
            return ButtonTapData(id: id, tapDate: tapDate)
        }
    }
}
