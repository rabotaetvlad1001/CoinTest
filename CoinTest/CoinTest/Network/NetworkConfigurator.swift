//
//  NetworkConfigurator.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

class NetworkConfigurator {
    private let apiUrl = "https://api.coincap.io/v2/"


    func getHeaders() -> [String: String] {
        return ["search":"eth"]
    }

    func getBaseUrl() -> String {
        return apiUrl
    }
}
