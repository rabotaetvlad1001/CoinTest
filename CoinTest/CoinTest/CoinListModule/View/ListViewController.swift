//
//  ListViewController.swift
//  CoinTest
//
//  Created by Cezar_ on 02.06.23.
//

import UIKit

class ListViewController: UIViewController {

    let network = NetworkManager()
    let model = CoinListData()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan

        model.loadCoinList()
    }
}

