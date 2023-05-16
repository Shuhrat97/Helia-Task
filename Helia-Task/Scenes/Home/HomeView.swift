//
//  HomeView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 14/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var router = UniversalRouter()
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("", destination: router.scene, isActive: $router.startRouting)
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                
                List(content: {
                    Text("Hello, Daniel 👋")
                        .font(.appFontBold(size: 32))
                        .listRowBackground(Color.backgroundColor)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<viewModel.categories.count) { index in
                                Button {
                                    viewModel.selectedCategory = index
                                } label: {
                                    if viewModel.selectedCategory == index {
                                        Text(viewModel.categories[index])
                                            .foregroundColor(.white)
                                            .font(.appFontSemiBold(size: 16))
                                            .padding(10)
                                            .padding(.horizontal, 10)
                                            .background(Color.appGreen)
                                            .cornerRadius(19)
                                    } else {
                                        Text(viewModel.categories[index])
                                            .foregroundColor(.appGreen)
                                            .font(.appFontSemiBold(size: 16))
                                            .padding(10)
                                            .padding(.horizontal, 10)
                                            .cornerRadius(19)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 19)
                                                    .stroke(Color.appGreen, lineWidth: 2)
                                            )
                                    }
                                }
                                .padding(5)
                            }
                        }
                    }
                    .listRowBackground(Color.backgroundColor)
                    
                    HStack {
                        Text("Recently Booked")
                            .font(.appFontBold(size: 18))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            Text("See all")
                                .font(.appFontBold(size: 16))
                                .foregroundColor(Color.appGreen)
                        }
                        
                    }
                    .listRowBackground(Color.backgroundColor)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach($viewModel.recentlyHotels) { hotel in
                                Button {
                                    router.scene = AnyView(EmptyView())
                                } label: {
                                    ExtractedView(hotel:hotel) {
                                        viewModel.favouriteBtnTapped(hotel:hotel.wrappedValue)
                                    }
                                }
                            }
                        }
                    }
                    .listRowBackground(Color.backgroundColor)
                    
                    ForEach($viewModel.hotels) { hotel in
                        Button {
                            router.scene = AnyView(EmptyView())
                        } label: {
                            HotelListItemView(hotel:hotel) {
                                viewModel.favouriteBtnTapped(hotel:hotel.wrappedValue)
                            }
                            .buttonStyle(.plain)
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    .listSectionSeparator(.hidden)
                    .listRowBackground(Color.backgroundColor)
                })
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: HStack {
                    Image("logo")
                    Text("Helia")
                        .font(.appFontBold(size: 24))
                    
                }, trailing: HStack{
                    Button {
                        //
                    } label: {
                        Image("notification")
                    }
                    
                    Button {
                        router.scene = AnyView(FavoriteView())
                    } label: {
                        Image("bookmark")
                    }
                    
                })
                .onAppear {
                    viewModel.onAppear()
                }
                .onChange(of: viewModel.selectedCategory) { newValue in
                    viewModel.onAppear()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

fileprivate struct ExtractedView: View {
    @Binding var hotel:HotelModel
    let btnTapped: () -> Void
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack {
                    Image("star")
                    Text(String(hotel.rate))
                        .foregroundColor(.white)
                }
                .padding(6)
                .padding(.horizontal, 6)
                .background (
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.appGreen)
                )
            }
            .padding(23)
            
            Spacer()
            
            Text(hotel.name)
                .foregroundColor(.white)
                .font(.appFontBold(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 23)
            
            Text(hotel.location)
                .foregroundColor(.white)
                .font(.appFontRegular(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 23)
            
            HStack {
                Text("$ \(String(hotel.price/100))")
                    .foregroundColor(.white)
                    .font(.appFontBold(size: 24))
                
                Text("/ per night")
                    .foregroundColor(.white)
                    .font(.appFontRegular(size: 14))
                
                Spacer()
                
                Button {
                    hotel.favorite.toggle()
                    btnTapped()
                } label: {
                    Image(hotel.favorite ? "bookmarkSelected" : "bookmark")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(hotel.favorite ? .appGreen : .white)
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                    
                }
                .buttonStyle(.borderless)
                
                
            }
            .padding(.horizontal, 23)
            .padding(.bottom)
        }
        .frame(width: 300, height: 400)
        .background(
            ZStack {
                Image(hotel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .cornerRadius(36)
                
                LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    .cornerRadius(36)
            }
        )
    }
}
