//
//  SearchView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var router = UniversalRouter()
    @StateObject var viewModel = SearchViewModel()
    
    let gridItems = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("", destination: router.scene, isActive: $router.startRouting)
                
                VStack {
                    HStack {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        TextField("", text: $viewModel.searchText)
                            .onChange(of: viewModel.searchText, perform: { newValue in
                                viewModel.search(text: newValue)
                            })
                        Button {
                            viewModel.showFilter = true
                        } label: {
                            Image("filter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding()
                    .background(Color(UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Filtered (\(viewModel.filteredHotel.count))")
                            .font(.appFontBold(size: 18))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Button {
                            viewModel.selectedStyle = .list
                        } label: {
                            Image(viewModel.selectedStyle == .list ? "bookingSelected" : "booking")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                        }
                        
                        Button {
                            viewModel.selectedStyle = .grid
                        } label: {
                            Image(viewModel.selectedStyle == .grid ? "categorySelected" : "category")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                        }
                        
                        
                    }
                    .padding()
                    
                    if viewModel.selectedStyle == .list {
                        List {
                            ForEach($viewModel.filteredHotel) { hotel in
                                Button {
                                    router.scene = AnyView(EmptyView())
                                } label: {
                                    HotelListItemView(hotel: hotel) {
                                        viewModel.favouriteBtnTapped(hotel: hotel.wrappedValue)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .listRowSeparator(.hidden)
                                .listSectionSeparator(.hidden)
                                .listRowBackground(Color.backgroundColor)
                            }
                        }
                        .listStyle(.plain)
                        .navigationBarTitleDisplayMode(.inline)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: gridItems, spacing: 16) {
                                ForEach($viewModel.filteredHotel) { hotel in
                                    Button {
                                        router.scene = AnyView(EmptyView())
                                    } label: {
                                        HotelGridItemView(hotel: hotel) {
                                            viewModel.favouriteBtnTapped(hotel: hotel.wrappedValue)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            }
                            .padding()
                        }
                        .background(Color.backgroundColor)
                    }
                }
                .background(Color.backgroundColor)
                .onAppear {
                    viewModel.onAppear()
                }
            }
            .sheet(isPresented: $viewModel.showFilter) {
                FilterView()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
