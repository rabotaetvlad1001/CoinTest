//
//  CoinListViewModel.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

protocol CoinListViewModelProtocol {
    var updateViewData: ((CoinListData)->())? { get set }
    func startFetch()
}

final class CoinListViewModel: CoinListViewModelProtocol {
    public var updateViewData: ((CoinListData) -> ())?

//    init() {
//        updateViewData?(.initial)
//    }

    public func startFetch() {

    }


}
