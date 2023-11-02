// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SGHelpers",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(
            name: "SGHelpers",
            targets: ["SGHelpers"]
        ),
    ],
    dependencies: [
        // .package(path: "../SwiftGodot"),
        // .package(url: "https://github.com/PadraigK/SwiftGodot", branch: "main"),
        // .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "main"),
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", from: "0.23.0"),
    ],
    targets: [
        .target(
            name: "SGHelpers",
            dependencies: ["SwiftGodot"]
        ),
    ]
)
