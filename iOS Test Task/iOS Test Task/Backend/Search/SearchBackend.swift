//
//  SearchBackedn.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 12.04.2022.
//

import UIKit

class SearchBackend: BaseBackend {
    
    init() {
        super.init("search")
    }

    func searchApplet(request: SearchRequest) async throws -> SearchResponse {
        return try await sendRequest(to: "applets", request: request)
    }
}
