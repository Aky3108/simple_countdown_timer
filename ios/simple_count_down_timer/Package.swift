// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "simple_count_down_timer",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(
            name: "simple-count-down-timer",
            targets: ["simple_count_down_timer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "simple_count_down_timer"
        ),
    ]
)
