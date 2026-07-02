//
//  FirebaseRemoteConfigService.swift
//  AppServicesFirebase
//
//  Created by AnhPT on 02/07/2026.
//

import AppServices
import FirebaseRemoteConfig

/// `RemoteConfigService` backed by Firebase Remote Config. Requires
/// `FirebaseApp.configure()` at launch. Falls back to the passed defaults until a
/// value has been fetched/activated.
public final class FirebaseRemoteConfigService: RemoteConfigService, @unchecked Sendable {
    private let remoteConfig: RemoteConfig

    public init(minimumFetchInterval: TimeInterval = 3600) {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = minimumFetchInterval
        remoteConfig.configSettings = settings
    }

    public func fetch() async throws {
        _ = try await remoteConfig.fetchAndActivate()
    }

    public func bool(_ key: String, default value: Bool) -> Bool {
        hasValue(key) ? remoteConfig[key].boolValue : value
    }

    public func string(_ key: String, default value: String) -> String {
        hasValue(key) ? remoteConfig[key].stringValue : value
    }

    public func int(_ key: String, default value: Int) -> Int {
        hasValue(key) ? remoteConfig[key].numberValue.intValue : value
    }

    /// A value that actually came from remote/defaults (not the static fallback).
    private func hasValue(_ key: String) -> Bool {
        remoteConfig[key].source != .static
    }
}
