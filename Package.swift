// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NickKit",
    products: [
        .library(
            name: "NickKit",
            targets: ["NickKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NickKit",
            dependencies: []
        ),
    ]
)
