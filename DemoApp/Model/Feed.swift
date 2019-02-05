//
//  Feed.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var id: Int
    var title: String
    var body : String
    var address : Address

}
struct Address :Codable {
    var streetName: String
    var City: String
    var State: String
}
