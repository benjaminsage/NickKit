// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NickKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "NickKit",
            targets: ["NickKit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/airbnb/lottie-ios.git",
            .upToNextMajor(from: "4.2.0")
        )
    ],
    targets: [
        .target(
            name: "NickKit",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            path: "Sources",
            resources: [.process("Resources/Fonts")]
        ),
    ]
)
