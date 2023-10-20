//
//  Activity.swift
//  BoredIdeas
//
//  Created by Елена Даниленко on 22.10.2023.
//

import Foundation



struct Activity: Codable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Float?
    let link: String?
    let key: String?
    let accessibility: Float?

    //let price, participants, accessibility: Double?
    /*
    "activity": "Take a caffeine nap",
    "type": "relaxation",
    "participants": 1,
    "price": 0.1,
    "link": "",
    "key": "5092652",
    "accessibility": 0.08
     */
}
