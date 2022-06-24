// swift-tools-version:5.0.0

import PackageDescription

let package = Package(
    name: "CFirebird",
	platforms: [
		.macOS(.v10_10),
	],
    products: [
        .library(
			name: "CFirebird",
			targets: ["CFirebird"]),
    ],
    targets: [
		.systemLibrary(
			name: "CFirebird",
			pkgConfig: "libfbclient"),
        .testTarget(
			name: "CFirebirdTests",
			dependencies: ["CFirebird"]),
    ]
)
