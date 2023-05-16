//
//  HotelListItemView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct HotelListItemView: View {
    @Binding var hotel:HotelModel
    let btnTapped: () -> Void
    var body: some View {
        HStack {
            Image(hotel.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            VStack {
                Text(hotel.name)
                    .font(.appFontBold(size: 20))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                Text(hotel.location)
                    .font(.appFontRegular(size: 14))
                    .foregroundColor(.grayTextColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                HStack {
                    Image("star")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                    
                    Text(String(hotel.rate))
                        .foregroundColor(.appGreen)
                        .font(.appFontSemiBold(size: 14))
                    
                    Text("(\(hotel.views) reviews)")
                        .font(.appFontRegular(size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            
            
            VStack {
                Text("$" + String(Int(hotel.price/100)))
                    .font(.appFontBold(size: 24))
                    .foregroundColor(.appGreen)
                
                Text("/ night")
                    .foregroundColor(.grayTextColor)
                    .font(.appFontRegular(size: 14))
                
                Spacer()
                
                Button {
                    hotel.favorite.toggle()
                    btnTapped()
                } label: {
                    Image(hotel.favorite ? "bookmarkSelected" : "bookmark")
                        .renderingMode(.template)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(hotel.favorite ? .appGreen : .black)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(14)
    }
}

struct HotelListItemView_Previews: PreviewProvider {
    static var previews: some View {
//        HotelListItemView(hotel: <#Hotel#>)
        EmptyView()
    }
}
