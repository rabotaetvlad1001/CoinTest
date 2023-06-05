//
//  CoinsService.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

class CoinsService {
    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func loadCoinList(completion: @escaping(Result<CoinListModel?, Error>)->Void) {
        self.networkManager.request(path: "assets", completion: completion)
    }
}
