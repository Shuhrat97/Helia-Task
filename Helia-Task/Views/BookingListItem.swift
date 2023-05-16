//
//  BookingListItem.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct BookingListItem: View {
    @Binding var hotel:HotelModel
    let cancelBtnTapped: () -> Void
    let viewBtnTapped: () -> Void
    var body: some View {
        VStack {
            HStack {
                Image(hotel.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                
                VStack(alignment: .leading) {
                    Text(hotel.name)
                        .font(.appFontBold(size: 20))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    Text(hotel.location)
                        .font(.appFontRegular(size: 14))
                        .foregroundColor(.grayTextColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    Text("Paid")
                        .font(.appFontSemiBold(size: 10))
                        .foregroundColor(.appGreen)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color(UIColor(red: 0.102, green: 0.714, blue: 0.361, alpha: 0.12)))
                        .cornerRadius(6)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                
                
            }
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel Booking")
                        .foregroundColor(.appGreen)
                        .font(.appFontSemiBold(size: 16))
                        .frame(height: 38)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(19)
                        .overlay(
                            RoundedRectangle(cornerRadius: 19)
                                .stroke(Color.appGreen, lineWidth: 2)
                        )
                }
                
                Button {
                    
                } label: {
                    Text("View Ticket")
                        .foregroundColor(.white)
                        .font(.appFontSemiBold(size: 16))
                        .frame(height: 38)
                        .frame(maxWidth: .infinity)
                        .background(Color.appGreen)
                        .cornerRadius(19)
                    
                    
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(14)
    }
}
