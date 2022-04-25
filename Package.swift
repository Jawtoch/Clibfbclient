// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CFirebird",
	platforms: [
		.macOS(.v10_10)
	],
    products: [
        .library(
            name: "CFirebird",
            targets: ["CFirebird"]),
    ],
    targets: [
		.systemLibrary(name: "CFirebird", pkgConfig: "libfbclient"),
        .testTarget(
            name: "CFirebirdTests",
            dependencies: ["CFirebird"]),
    ]
)
