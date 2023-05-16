//
//  HotelGridItemView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct HotelGridItemView: View {
    @Binding var hotel:HotelModel
    let btnTapped: () -> Void
    var body: some View {
        VStack {
            Image(hotel.image)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(7/6, contentMode: .fill)
                .cornerRadius(16)
            
            Text(hotel.name)
                .font(.appFontBold(size: 18))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.black)
            
            HStack {
                Image("star")
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
                
                Text(String(hotel.rate))
                    .foregroundColor(.appGreen)
                    .font(.appFontSemiBold(size: 14))
                
                Text(hotel.location)
                    .font(.appFontRegular(size: 14))
                    .foregroundColor(.grayTextColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            
            HStack {
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
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct HotelGridItemView_Previews: PreviewProvider {
    static var previews: some View {
//        HotelGridItemView()
        EmptyView()
    }
}
