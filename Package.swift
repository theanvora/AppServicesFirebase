// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppServicesFirebase",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "AppServicesFirebase", targets: ["AppServicesFirebase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/anvyxhq/AppServices.git", from: "2.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.0.0"),
    ],
    targets: [
        .target(
            name: "AppServicesFirebase",
            dependencies: [
                .product(name: "AppServices", package: "AppServices"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
            ]
        ),
    ]
)
