//
//  ServiceHandler.swift
//  DailyFX
//
//  Created by Catherine on 07/11/21.
//

import UIKit

typealias ResponseHandler<T:Decodable> = (Result<T, Error>) -> Void
typealias ImageHandler = (Result<UIImage, Error>) -> Void

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
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(parsedData))
                
            } catch(let error) {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    class func loadImage(from url: URL, completion: @escaping ImageHandler) {
        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(NetworkError.invalidImage))
            }
        }
        task.resume()
    }
}
