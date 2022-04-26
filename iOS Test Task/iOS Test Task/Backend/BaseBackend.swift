//
//  GeoGebraRemoteApi.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 12.04.2022.
//

import UIKit

open class BaseBackend {
    
    private let urlName = "https://api.geogebra.org"
    private let version = "v1.0"
    private let endpointName: String
    
    let utilities = ApiUtilities()
    
    init(_ endpointName: String) {
        self.endpointName = endpointName
    }
    
    func sendRequest(to endpoint: String, request: SearchRequest) async throws -> SearchResponse {
        let endpoint = createUrl(endpoint)
        return try await utilities.getRequest(endpoint, request)
    }
        
    private func createUrl(_ endpoint: String) -> String {
        return "\(urlName)/\(version)/\(endpointName)/\(endpoint)"
    }
}
