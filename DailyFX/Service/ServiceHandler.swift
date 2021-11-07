//
//  ServiceHandler.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import Foundation

typealias ResponseHandler<T:Decodable> = (Result<T, Error>) -> Void
class ServiceHandler {
    
    class func makeRequest<T: Decodable>(responseType:T.Type, completion: @escaping ResponseHandler<T>) {
        let session = URLSession.shared
        
        guard let url =  URL(string: API.url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            guard let parsedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(NetworkError.parseError))
                return
            }
            completion(.success(parsedData))
        }
        task.resume()
    }
}
