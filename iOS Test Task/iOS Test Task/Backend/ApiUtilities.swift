//
//  ApiUtilities.swift
//  iOS Test Task
//
//  Created by Balázs Bencze on 12.04.2022.
//

import UIKit

class ApiUtilities {
    
    private let decoder = JSONDecoder()
    
    func getRequest<T>(_ url: String, _ parameter: Codable) async throws -> T where T: Decodable {
        let data = try await sendRequest(url, parameter.dictionary)
        let response = try decoder.decode(T.self, from: data)
        return response
    }
    
    private func sendRequest(_ url: String, _ parameters: [String: Any]?) async throws -> Data {
        // Implement this method that sends a get request to the specified url with
        // the sepcified parameters and returns the data object that it gets as a response
        return Data()
    }
    
    func downloadImage(url: String) async throws -> UIImage {
        let request = URLRequest(url: URL(string: url)!)
        let (imageData, _) = try await URLSession.shared.data(for: request)
        return UIImage(data: imageData)!
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
