//
//  CoinListModel.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

struct CoinListModel: Decodable {
    let data: [CoinModel]
    let timestamp: Int
}

class CoinListData {

    weak var coinService = DI.shared.coinService
    var coinList = [CoinModel]() {
        didSet {
            print("!-!-coinList:\(coinList.count)")
        }
    }

    enum CoinListData {
        case initial
        case loading(CoinListModel)
        case success(CoinListModel)
        case failure(CoinListModel)
    }

    func loadCoinList() {
        coinService?.loadCoinList { (result: Result<CoinListModel?, Error>) in
            switch (result) {
            case .success(let coinListModel):
                self.coinList.removeAll()
                self.coinList.append(contentsOf: coinListModel?.data ?? [CoinModel]())
            case .failure(let error):
                print((error as? CustomError)?.message)
            }
        }
    }
}
