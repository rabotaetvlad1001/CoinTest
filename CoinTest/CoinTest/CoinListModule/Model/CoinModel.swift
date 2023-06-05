//
//  CoinModel.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

struct CoinModel: Decodable {
    let id: String
    let rank: String
    let symbol: String?
    let name: String?
    let supply: String?
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    let vwap24Hr: String?
    let explorer: String?
}
