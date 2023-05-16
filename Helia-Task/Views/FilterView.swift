//
//  FilterView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct FilterView: View {
    let countries:[String] = ["France", "Italia", "Turkiye", "Germany", "Uzbekistan", "Russia"]
    @State var selectedCountry:Int = 0
    
    let sortResults:[String] = ["Highest Popularity", "Highest Price", "Lowest Price", "Lowest Popularity"]
    @State var selectedSort:Int = 0
    
    @State var sliderPosition: ClosedRange<Int> = 2...40
    
    let rates:[Int] = [5, 4, 3, 2, 1]
    @State var selectedRate:Int = 0
    
    let facilities:[String] = ["WiFi", "Swimming Pool", "Parking", "Restaurant"]
    @State var selectedFacilities:Set<String> = []
    
    let accommodationTypes:[String] = ["Hotels", "Resorts", "Villas", "Apartments"]
    @State var selectedAccommodationTypes:Set<String> = []
    
    var body: some View {
        NavigationView {
            VStack {
                
                Divider()
                    .padding(.horizontal)
                
                ScrollView(content: {
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<countries.count) { index in
                                    Button {
                                        selectedCountry = index
                                    } label: {
                                        if selectedCountry == index {
                                            Text(countries[index])
                                                .foregroundColor(.white)
                                                .font(.appFontSemiBold(size: 16))
                                                .padding(10)
                                                .padding(.horizontal, 10)
                                                .background(Color.appGreen)
                                                .cornerRadius(19)
                                        } else {
                                            Text(countries[index])
                                                .foregroundColor(.appGreen)
                                                .font(.appFontSemiBold(size: 16))
                                                .padding(10)
                                                .padding(.horizontal, 10)
                                                .background(Color.white)
                                                .cornerRadius(19)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 19)
                                                        .stroke(Color.appGreen, lineWidth: 2)
                                                )
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.leading)
                                }
                            }
                        }
                        
                    } header: {
                        SectionView(title: "Country", btnTitle: "See All", showButton: true) {
                            
                        }
                    }
                    
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<sortResults.count) { index in
                                    Button {
                                        selectedSort = index
                                    } label: {
                                        if selectedSort == index {
                                            Text(sortResults[index])
                                                .foregroundColor(.white)
                                                .font(.appFontSemiBold(size: 16))
                                                .padding(10)
                                                .padding(.horizontal, 10)
                                                .background(Color.appGreen)
                                                .cornerRadius(19)
                                        } else {
                                            Text(sortResults[index])
                                                .foregroundColor(.appGreen)
                                                .font(.appFontSemiBold(size: 16))
                                                .padding(10)
                                                .padding(.horizontal, 10)
                                                .background(Color.white)
                                                .cornerRadius(19)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 19)
                                                        .stroke(Color.appGreen, lineWidth: 2)
                                                )
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.leading)
                                }
                            }
                        }
                        
                    } header: {
                        SectionView(title: "Sort Results", btnTitle: "", showButton: false) {
                            
                        }
                    }
                    
                    Section(content: {
                        RangedSliderView(value: $sliderPosition, bounds: 0...100)
                            .padding(.top)
                            .padding()
                    }, header: {
                        SectionView(title: "Price Range Per Night", btnTitle: "", showButton: false) {
                            
                        }
                    })
                    
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<rates.count) { index in
                                    Button {
                                        selectedRate = index
                                    } label: {
                                        if selectedRate == index {
                                            HStack {
                                                Image("star")
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                
                                                Text(String(rates[index]))
                                                    .foregroundColor(.white)
                                                    .font(.appFontSemiBold(size: 16))
                                            }
                                            .padding(10)
                                            .padding(.horizontal, 10)
                                            .background(Color.appGreen)
                                            .cornerRadius(19)
                                        } else {
                                            HStack {
                                                Image("star")
                                                    .renderingMode(.template)
                                                    .foregroundColor(.appGreen)
                                                Text(String(rates[index]))
                                                    .foregroundColor(.appGreen)
                                                    .font(.appFontSemiBold(size: 16))
                                            }
                                            .padding(10)
                                            .padding(.horizontal, 10)
                                            .background(Color.white)
                                            .cornerRadius(19)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 19)
                                                    .stroke(Color.appGreen, lineWidth: 2)
                                            )
                                        }
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.leading)
                                }
                            }
                        }
                        
                    } header: {
                        SectionView(title: "Sort Results", btnTitle: "", showButton: false) {
                            
                        }
                    }
                    
                    
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<facilities.count) { index in
                                    Button {
                                        if (selectedFacilities.contains(facilities[index])) {
                                            selectedFacilities.remove(facilities[index])
                                        } else {
                                            selectedFacilities.insert(facilities[index])
                                        }
                                    } label: {
                                        HStack {
                                            Image(selectedFacilities.contains(facilities[index]) ? "checked" : "unchecked")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            
                                            Text(facilities[index])
                                                .foregroundColor(.black)
                                                .font(.appFontSemiBold(size: 14))
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                        
                    } header: {
                        SectionView(title: "Facelities", btnTitle: "See All", showButton: true) {
                            
                        }
                    }
                    
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<accommodationTypes.count) { index in
                                    Button {
                                        if (selectedAccommodationTypes.contains(accommodationTypes[index])) {
                                            selectedAccommodationTypes.remove(accommodationTypes[index])
                                        } else {
                                            selectedAccommodationTypes.insert(accommodationTypes[index])
                                        }
                                    } label: {
                                        HStack {
                                            Image(selectedAccommodationTypes.contains(accommodationTypes[index]) ? "checked" : "unchecked")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            
                                            Text(accommodationTypes[index])
                                                .foregroundColor(.black)
                                                .font(.appFontSemiBold(size: 14))
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                        
                    } header: {
                        SectionView(title: "Accomodation Type", btnTitle: "See All", showButton: true) {
                            
                        }
                    }
                    
                })
                
                Divider()
                    .padding(.horizontal)
                
                HStack {
                    Button  {
                        
                    } label: {
                        Text("Reset")
                            .font(.appFontBold(size: 16))
                            .foregroundColor(.appGreen)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor(red: 0.91, green: 0.973, blue: 0.937, alpha: 1)))
                            .cornerRadius(29)
                    }
                    
                    
                    Button  {
                        
                    } label: {
                        Text("Apply Filter")
                            .font(.appFontBold(size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.appGreen)
                            .cornerRadius(29)
                    }
                    
                }
                .padding()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("FilteredHotel")
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

