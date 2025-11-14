// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GTVSdkIos",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GTVSdkIos",
            targets: ["GTVSdkIosCoreWrapper"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "12.3.0"
        ),
        .package(
            url: "https://github.com/ab180/airbridge-ios-sdk-deployment",
            from: "4.8.1"
        ),
    ],
    targets: [

        // MARK: - Core Binary
        .binaryTarget(
            name: "GTVSdkIos",
            path: "GTVSdkIos.xcframework"
        ),

        // MARK: - Core Wrapper
        .target(
            name: "GTVSdkIosCoreWrapper",
            dependencies: [
                "GTVSdkIos",
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "Airbridge", package: "airbridge-ios-sdk-deployment"),
            ],
            path: "Sources/GTVSdkIosCoreWrapper"
        ),
    ]
)

