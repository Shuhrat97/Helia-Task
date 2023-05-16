//
//  UserPreferences.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import Foundation

class UserPreferences {
    
    static let shared = UserPreferences()
    
    private let standard = UserDefaults.standard
    
    var favoriteHotels: Set<HotelModel> {
        get {
            if let user = standard.structData(Set<HotelModel>.self, forKey: "favoriteHotels") {
                return user
            }
            return []
        } set {
            standard.setStruct(newValue, forKey: "favoriteHotels")
        }
    }
    
    func isFavourite(hotel: HotelModel)->Bool{
        let isFavourite = favoriteHotels.contains { item in
            item.id == hotel.id
        }
        return isFavourite
    }
}

extension UserDefaults {
    
    open func setStruct<T: Codable>(_ value: T?, forKey defaultName: String) {
        do {
            let data = try JSONEncoder().encode(value)
            set(data, forKey: defaultName)
        } catch {
            print("error", error)
        }
        
    }
    
    open func structData<T>(_ type: T.Type, forKey defaultName: String) -> T? where T : Decodable {
        guard let encodedData = data(forKey: defaultName) else {
            return nil
        }
        do {
            let data = try JSONDecoder().decode(type, from: encodedData)
            return data
        } catch {
            print("decodingError \(error)")
            return nil
        }
    }
    
}


extension HotelModel:Equatable, Hashable{
    static func ==(lhs: HotelModel, rhs: HotelModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
