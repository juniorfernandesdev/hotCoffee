//
//  OrderTableViewController.swift
//  HotCoffee
//
//  Created by Junior Fernandes on 08/03/21.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }

    private func populateOrders() {
        guard let coffeeOrderUrl = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
            return
        }

        let resource = Resource<[Order]>(url: coffeeOrderUrl)

        WebService().load(resorce: resource) { (result) in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}
