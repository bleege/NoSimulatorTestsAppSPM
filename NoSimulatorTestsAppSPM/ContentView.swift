//
//  ContentView.swift
//  NoSimulatorTestsApp
//
//  Created by Brad Leege on 11/8/24.
//

import NoSimulatorData
import SwiftUI

protocol ContentViewModel: ObservableObject {
    var buttonTaps: [ButtonTap] { get }
    
    func handleNowButtonTapped()
    func handleOnAppear()
}

struct ContentView<Model: ContentViewModel>: View {
    @StateObject var model: Model

    var body: some View {
        VStack {
            Button("Generate New Tap") {
                model.handleNowButtonTapped()
            }
            .buttonStyle(.borderedProminent)
            List(model.buttonTaps, id: \.id) { tap in
                VStack {
                    HStack {
                        Text(tap.id.uuidString)
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(tap.dateTapped.formatted(.dateTime))
                            .font(.caption)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .padding([.leading, .trailing], 0)
        .onAppear {
            model.handleOnAppear()
        }
    }
}

#if DEBUG || DEBUG_SIMULATOR

class ContentViewModelMock: ContentViewModel {
    @Published var buttonTaps = [
        ButtonTap(id: UUID(), dateTapped: Date()),
        ButtonTap(id: UUID(), dateTapped: Date())
    ]
    
    func handleNowButtonTapped() { }
    func handleOnAppear() { }
}

#Preview {
    ContentView(
        model: ContentViewModelMock()
    )
}

#endif

