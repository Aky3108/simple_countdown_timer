// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "simple_count_down_timer",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "simple_count_down_timer",
            targets: ["simple_count_down_timer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "simple_count_down_timer",
            dependencies: [],
            path: "Classes"
        ),
    ]
)
