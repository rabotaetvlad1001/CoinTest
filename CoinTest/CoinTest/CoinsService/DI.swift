//
//  DI.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

class DI {
    static let shared = DI()

    lazy var networkManager: NetworkManager = {
        return NetworkManager()
    }()

    lazy var coinService: CoinsService = {
        return CoinsService(networkManager: networkManager)
    }()
}
