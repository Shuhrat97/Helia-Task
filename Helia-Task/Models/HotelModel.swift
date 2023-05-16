//
//  HotelModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import Foundation

struct HotelModel:Identifiable, Codable {
    let id: String
    let name:String
    let location:String
    let price:Double
    let rate:Double
    let views:Int
    var favorite:Bool = false
    let image: String
    var status:Status?
    
    static func preview() -> HotelModel {
        HotelModel(id: UUID().uuidString, name: "President Hotel", location: "Paris, France", price: 3500, rate: 4.8, views: 4378, favorite: false, image: "Image1")
    }
}
