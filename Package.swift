// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SGHelpers",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SGHelpers",
            targets: ["SGHelpers"]
        ),
    ],
    dependencies: [
        // .package(path: "../SwiftGodot"),
        // .package(url: "https://github.com/PadraigK/SwiftGodot", branch: "main"),
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SGHelpers",
            dependencies: ["SwiftGodot"]
        ),
        .testTarget(
            name: "SGHelpersTests",
            dependencies: ["SGHelpers"]
        ),
    ]
)
