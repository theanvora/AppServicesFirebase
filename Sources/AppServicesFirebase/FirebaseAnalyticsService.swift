//
//  FirebaseAnalyticsService.swift
//  AppServicesFirebase
//
//  Created by AnhPT on 02/07/2026.
//

import AppServices
import FirebaseAnalytics

/// `AnalyticsService` backed by Firebase Analytics. Requires `FirebaseApp.configure()`
/// at launch. Wire it into a `CompositeAnalytics` or use it directly.
public struct FirebaseAnalyticsService: AnalyticsService {
    public init() {}

    public func log(event name: String, parameters: [String: Any]) {
        Analytics.logEvent(name, parameters: parameters.isEmpty ? nil : parameters)
    }

    public func setUserProperty(_ value: String?, for name: String) {
        Analytics.setUserProperty(value, forName: name)
    }

    public func setUserID(_ id: String?) {
        Analytics.setUserID(id)
    }
}
