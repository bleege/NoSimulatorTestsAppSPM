// swift-tools-version: 5.10.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NoSimulatorModel",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NoSimulatorModel",
            targets: ["NoSimulatorModel"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NoSimulatorModel",
            resources: [
                .copy("Resources/NoSimulatorCoreDataModel.xcdatamodeld")
            ]
        ),
        .testTarget(
            name: "NoSimulatorModelTests",
            dependencies: ["NoSimulatorModel"]
        ),
    ]
)


// Compile Model
// /Applications/Xcode.app/Contents/Developer/usr/bin/momc --sdkroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk --iphoneos-deployment-target 18.0 --module NoSimulatorModel /Users/brad/development/NoSimulatorTestsAppSPM/NoSimulatorModel/Sources/NoSimulatorModel/Resources/NoSimulatorCoreDataModel.xcdatamodeld /Users/brad/development/NoSimulatorTestsAppSPM/NoSimulatorModel/Sources/NoSimulatorModel/Resources

