//
//  CustomError.swift
//  CoinTest
//
//  Created by Cezar_ on 04.06.23.
//

import Foundation

class CustomError: Error {

    var message: String

    init(message: String) {
        self.message = message
    }
}
