//
//  NetworkManager.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class NetworkManager {
    private let config = NetworkConfigurator()

    private lazy var urlSession: URLSession? = {
        let session = URLSession(configuration: .default)
        return session
    }()
    private var dataTask: URLSessionDataTask? = nil

    func request<T: Decodable >(path: String, method: Method = .get, parametrs: [String: String] = [String: String](), _ headers: [String: String] = [String: String](), completion: @escaping(Result<T,Error>)->Void) {
        let apiUrlPath = "\(config.getBaseUrl())\(path)"

        guard let url = URL(string: apiUrlPath) else {
            completion(.failure(CustomError(message: "Empty url")))
            return
        }
        var fullUrl = url
        let allHeaders = headers.merging(config.getHeaders()) { $1 }

        for header in allHeaders {
            fullUrl.append(queryItems: [URLQueryItem(name: header.key, value: header.value)])
        }

        let urlRequest = URLRequest(url: fullUrl)

        print("URL: \(urlRequest.url?.absoluteString ?? "")")

        self.dataTask = urlSession?.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let data = data {
                let json = String(data: data, encoding: .utf8)
                print(json)
                do {
                    let content = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(content ))
                } catch {
                    print(error)
                    completion(.failure(CustomError(message: "Can not decode json")))
                }
            } else {
                completion(.failure(CustomError(message: "No data")))
            }
        })
        self.dataTask?.resume()
    }
}
