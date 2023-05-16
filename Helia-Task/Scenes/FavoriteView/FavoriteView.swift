//
//  FavoriteView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var router = UniversalRouter()
    @StateObject var viewModel = FavoriteViewModel()
    
    var body: some View {
        List($viewModel.hotels){ hotel in
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
        .background(Color.backgroundColor)
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Favorite")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
