// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UAL",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "UAL",
            targets: ["UAL"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UAL",
            dependencies: [],
            resources: [.process("Resources")]),
        .testTarget(
            name: "UALTests",
            dependencies: ["UAL"]),
    ]
)
