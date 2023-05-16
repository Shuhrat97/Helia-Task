//
//  HomeViewModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var recentlyHotels:[HotelModel] = []
    @Published var hotels:[HotelModel] = []
    let categories:[String] = ["Recommended", "Popular", "Trending"]
    @Published var selectedCategory:Int = 0
    
    func onAppear(){
        getRecentlyHotels()
        getHotels()
    }
    
    private func getRecentlyHotels(){
        var arr:[HotelModel] = []
        for i in 0..<10 {
            let id = UUID().uuidString
            let name = "President Hotel \(i)"
            let location = "Paris, France \(i)"
            let price = Double(Int.random(in: 1000...10000))
            let rate = Double.random(in: 1.0...5.0)
            let views = Int.random(in: 1...10000)
            let favorite = false
            let image = "Image1"
            let h = HotelModel(id: id, name: name, location: location, price: price, rate: Double(round(100 * rate) / 100), views: views, favorite: favorite, image: image)
            arr.append(h)
        }
        recentlyHotels = arr
    }
    
    private func getHotels() {
        var arr:[HotelModel] = []
        for i in 0..<10 {
            let id = UUID().uuidString
            let name = "President Hotel \(i)"
            let location = "Paris, France \(i)"
            let price = Double(Int.random(in: 1000...10000))
            let rate = Double.random(in: 1.0...5.0)
            let views = Int.random(in: 1...10000)
            let favorite = false
            let image = "presidentHotel"
            let h = HotelModel(id: id, name: name, location: location, price: price, rate: Double(round(100 * rate) / 100), views: views, favorite: favorite, image: image)
            arr.append(h)
        }
        hotels = arr
    }
    
    func favouriteBtnTapped(hotel: HotelModel){
        if UserPreferences.shared.isFavourite(hotel: hotel) {
            UserPreferences.shared.favoriteHotels.remove(hotel)
        } else {
            UserPreferences.shared.favoriteHotels.insert(hotel)
        }
    }
}
