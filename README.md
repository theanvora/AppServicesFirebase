# AppServicesFirebase

Firebase adapters for [AppServices](https://github.com/anvyxhq/AppServices):
analytics and remote config implementations of the vendor-agnostic ports, so your
app depends on the protocols while Firebase stays isolated here.

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-blue.svg)](https://developer.apple.com/ios/)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Features

- **`FirebaseAnalyticsService`** — implements `AnalyticsService` on Firebase Analytics.
- **`FirebaseRemoteConfigService`** — implements `RemoteConfigService` /
  `FeatureFlagProvider` on Firebase Remote Config.

## Installation

```swift
.package(url: "https://github.com/anvyxhq/AppServicesFirebase.git", branch: "main")
```

Call `FirebaseApp.configure()` at launch and add your `GoogleService-Info.plist`.

## Usage

```swift
import AnvyxServiceKit
import AnvyxServiceFirebaseKit

// App depends on the ports; swap Firebase in at the composition root.
let analytics: AnalyticsService = CompositeAnalytics([FirebaseAnalyticsService()])
analytics.log(event: "document_exported", parameters: ["pages": 3])

let config: RemoteConfigService = FirebaseRemoteConfigService()
try await config.fetch()
if config.bool("new_paywall", default: false) { showNewPaywall() }
```

## Requirements

- iOS 17+ · Swift 5.9+ · Firebase iOS SDK 11+

## License

MIT
