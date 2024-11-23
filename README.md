# NoSimulatorTestsAppSPM

## Description

iOS project to demonstrate running unit tests without having to launch an iOS Simulator.  Instead the unit tests are run via the host's macOS enivornment.
This enables unit tests to complete quicker while eliminating the risk of failure on CI due to an iOS Simulator not launching.

## Project Structure

The project consists of:

1. NoSimulatorTestsApp
    * iOS App containing SwiftUI View and ViewModel
2. Swift Package
    * NoSimulatorModel
      * Data Layer with no dependencies on UI Frameworks
    * NoSimulatorModelTests
      * Unit Tests for NoSimulatorModel 

<img width="311" alt="project-structure" src="https://github.com/user-attachments/assets/8055f58e-44f9-4c18-9a2e-5de47b86c48d">

## Architecture

The app uses SwiftUI for the View along with a common MVVM structure using View Models accessing data via the Repoistory Pattern and Data Managers.  The Model and Test layers use Swift, CoreData, and Swift Testing.

## Testing

### In Xcode

Testing without an iOS Simulator is configured by creating a new Scheme that uses `NoSimulatorModelTests`.

<img width="316" alt="test-scheme" src="https://github.com/user-attachments/assets/c42eaa35-0baf-47b5-a968-255890a954a7">

### Command Line / CI

Testing is performed using SPM's `swift test` on the command line.  One addition to the usual SPM test flow is the need to first compile the enclosed Core Data model, `NoSimulatorCoreDataModel.xcdatamodeld`, so that the compiled Swift code can access it.

This process is [automated for GitHub Workflows](https://github.com/bleege/NoSimulatorTestsAppSPM/blob/fde0d715d28cf99839830e5ae4c3a41f9f239f3b/.github/workflows/no-simulator-model-tests.yml#L19-L24) and can also be used locally via Terminal as well.

## App Functionality

The app's functionality is to create and persist button tap data in Core Data and then display it on the main screen.

![app-ui](https://github.com/user-attachments/assets/71dba3db-753f-4eee-8d63-534207ab85c5)

