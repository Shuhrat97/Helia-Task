//
//  SearchViewModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    enum Style {
        case list
        case grid
    }
    
    @Published var hotels:[HotelModel] = []
    @Published var selectedStyle:Style = .list
    @Published var searchText:String = ""
    @Published var filteredHotel:[HotelModel] = []
    @Published var showFilter: Bool = false
    
    func onAppear(){
        getHotels()
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
        filteredHotel = hotels
    }
    
    func favouriteBtnTapped(hotel: HotelModel){
        if UserPreferences.shared.isFavourite(hotel: hotel) {
            UserPreferences.shared.favoriteHotels.remove(hotel)
        } else {
            UserPreferences.shared.favoriteHotels.insert(hotel)
        }
    }
    
    func search(text:String){
        guard !text.isEmpty else {
            filteredHotel = hotels
            return
        }
        filteredHotel =  hotels.filter { $0.name.lowercased().contains(text.lowercased()) }
    }
}
