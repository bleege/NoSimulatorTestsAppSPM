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
    dependencies: [
        .package(name: "NoSimulatorData", path: "../NoSimulatorData")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NoSimulatorModel",
            dependencies: [
                "NoSimulatorData"
            ],
            resources: [
                .copy("Resources/NoSimulatorCoreDataModel.xcdatamodeld"),
                .copy("Resources/NoSimulatorCoreDataModel.momd")
            ]
        ),
        .testTarget(
            name: "NoSimulatorModelTests",
            dependencies: ["NoSimulatorModel"]
        ),
    ]
)
