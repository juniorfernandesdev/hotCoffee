//
//  Order.swift
//  HotCoffee
//
//  Created by Junior Fernandes on 08/03/21.
//

//{
//  "name": "Junior Fernandes",
//  "email": "juniorbass8@gmail.com",
//  "type": "Latte",
//  "size": "medium"
//}

import Foundation

class Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
