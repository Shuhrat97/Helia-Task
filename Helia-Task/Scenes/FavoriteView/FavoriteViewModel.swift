//
//  FavoriteViewModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

class FavoriteViewModel: ObservableObject {
    @Published var hotels:[HotelModel] = []
    
    func onAppear(){
        reload()
    }
    
    func reload() {
        hotels = Array(UserPreferences.shared.favoriteHotels)
    }
    
    func favouriteBtnTapped(hotel: HotelModel){
        if UserPreferences.shared.isFavourite(hotel: hotel) {
            UserPreferences.shared.favoriteHotels.remove(hotel)
        } else {
            UserPreferences.shared.favoriteHotels.insert(hotel)
        }
        reload()
    }
}
