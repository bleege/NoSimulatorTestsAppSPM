//
//  ContentViewModel.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import Foundation
import NoSimulatorModel
import NoSimulatorData

class DefaultContentViewModel: ContentViewModel {
    @Published var buttonTaps = [ButtonTap]()
    
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
        buttonTaps.removeAll()
        buttonTaps.append(contentsOf: try modelRepository.loadAllButtonTaps())
    }
}
