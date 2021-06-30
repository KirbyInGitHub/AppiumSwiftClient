// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AppiumSwiftClient",
    platforms: [
        .iOS(.v14), .macOS(.v11)
    ],
    products: [
      .library(name: "AppiumSwiftClient", targets: ["AppiumSwiftClient"]),
    ],
    dependencies: [
        .package(name: "Mockingjay", url: "https://github.com/ppamorim/Mockingjay", .branch("master")),
    ],
    targets: [
        .target(
            name: "AppiumSwiftClient",
            dependencies: [
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(name: "AppiumTests", dependencies: [
            .target(name: "AppiumSwiftClient")
        ]),
        .testTarget(name: "AppiumSwiftClientUnitTests", dependencies: [
            .target(name: "AppiumSwiftClient"),
            .product(name: "Mockingjay", package: "Mockingjay", condition: .none),
        ])
        
    ]
)
