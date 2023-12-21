// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
      .iOS(.v17),
      .macOS(.v14),
    ],
    products: [
      .library(name: "Networking", targets: ["Networking"]),
      .library(name: "DesignSystem", targets: ["DesignSystem"]),
      .library(name: "Models", targets: ["Models"]),
    ],
    dependencies: [],
    targets: [
      .target(name: "Networking"),
      .target(name: "DesignSystem"),
      .target(name: "Models"),
    ]
)
