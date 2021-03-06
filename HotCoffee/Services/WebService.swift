//
//  WebService.swift
//  HotCoffee
//
//  Created by Junior Fernandes on 08/03/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    func load<T>(resorce: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {

        URLSession.shared.dataTask(with: resorce.url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }

        }.resume()
    }
}
