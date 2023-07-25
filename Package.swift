// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MisskeyAPIKit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MisskeyAPIKit",
            targets: ["MisskeyAPIKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
        .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "3.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MisskeyAPIKit",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Mocker", package: "Mocker"),
            ]
        ),
        .testTarget(
            name: "MisskeyAPIKitTests",
            dependencies: ["MisskeyAPIKit"],
            resources: [
                .copy("Resources"),
            ]
        ),
    ]
)
