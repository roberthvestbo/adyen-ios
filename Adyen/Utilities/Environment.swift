//
// Copyright (c) 2020 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Struct that defines the environment to retrieve resources from.
public struct Environment: APIEnvironment {
    
    /// :nodoc:
    public var baseURL: URL
    
    /// :nodoc:
    public var headers: [String: String] = ["Content-Type": "application/json"]
    
    /// :nodoc:
    public var queryParameters: [URLQueryItem] {
        guard let clientKey = clientKey else { return [] }
        return [URLQueryItem(name: "token", value: clientKey)]
    }
    
    /// :nodoc:
    public var clientKey: String?
    
    /// Adyen's test environment.
    public static let test = Environment(baseURL: URL(string: "https://checkoutshopper-test.adyen.com/")!)
    
    /// Adyen's default live environment.
    public static let live = Environment(baseURL: Environment.defaultLiveBaseURL)
    
    /// Adyen's European live environment.
    public static let liveEurope = Environment.live
    
    /// Adyen's Australian live environment.
    public static let liveAustralia = Environment(baseURL: URL(string: "https://checkoutshopper-live-au.adyen.com/")!)
    
    /// Adyen's United States live environment.
    public static let liveUnitedStates = Environment(baseURL: URL(string: "https://checkoutshopper-live-us.adyen.com/")!)

    @available(*, deprecated, message: "This init is deprecated. Use `init(baseURL:)` instead.")
    public init(baseURL: URL? = nil, cardPublicKeyBaseURL: URL? = nil) {
        self.baseURL = baseURL ?? Environment.defaultLiveBaseURL
    }

    public init(baseURL: URL? = nil) {
        self.baseURL = baseURL ?? Environment.defaultLiveBaseURL
    }
    
    // MARK: - Private
    
    private static let defaultLiveBaseURL = URL(string: "https://checkoutshopper-live.adyen.com/")!
}
