// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "UAL",
    platforms: [.macOS(.v10_15), .iOS(.v15)],
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


//extension PackageDescription.Product {
//  public static func iOSApplication(
//      name: String,
//      targets: [String],
//      bundleIdentifier: String? = nil,
//      teamIdentifier: String? = nil,
//      displayVersion: String? = nil,
//      bundleVersion: String? = nil,
//      iconAssetName: String? = nil,
//      accentColorAssetName: String? = nil,
//      supportedDeviceFamilies: [PackageDescription.ProductSetting.IOSAppInfo.DeviceFamily],
//      supportedInterfaceOrientations: [PackageDescription.ProductSetting.IOSAppInfo.InterfaceOrientation],
//      capabilities: [PackageDescription.ProductSetting.IOSAppInfo.Capability] = [],
//      additionalInfoPlistContentFilePath: String? = nil
//  ) -> PackageDescription.Product {
//
//  }
//}



