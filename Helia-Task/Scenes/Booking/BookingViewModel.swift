//
//  BookingViewModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI


class BookingViewModel: ObservableObject {
    @Published var hotels:[HotelModel] = []
    
    @Published var filteredHotels:[HotelModel] = []
    
    let items:[Status] = Status.allCases
    @Published var selectedStatus:Status = .ongoing
    
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
            let status = items[Int.random(in: 0...2)]
            let h = HotelModel(id: id, name: name, location: location, price: price, rate: Double(round(100 * rate) / 100), views: views, favorite: favorite, image: image, status: status)
            arr.append(h)
        }
        hotels = arr
        filter()
    }
    
    func filter(){
        filteredHotels = hotels.filter { hotel in
            print(hotel)
            return hotel.status == selectedStatus
        }
    }
}
