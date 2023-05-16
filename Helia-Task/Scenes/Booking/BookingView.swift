//
//  BookingView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

enum Status: String, CaseIterable, Codable {
    case ongoing
    case completed
    case canceled
}

struct BookingView: View {
    
    @StateObject var router = UniversalRouter()
    @StateObject var viewModel = BookingViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("", destination: router.scene, isActive: $router.startRouting)
                
                List {
                    Section {
                        ForEach($viewModel.filteredHotels) { hotel in
                            Button {
                                router.scene = AnyView(EmptyView())
                            } label: {
                                BookingListItem(hotel: hotel) {
                                    
                                } viewBtnTapped: {
                                    
                                }
                                .buttonStyle(.plain)
                            }
                            .listRowSeparator(.hidden)
                            .listSectionSeparator(.hidden)
                            .listRowBackground(Color.backgroundColor)
                        }
                    } header: {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<viewModel.items.count) { index in
                                    Button {
                                        viewModel.selectedStatus = viewModel.items[index]
                                        viewModel.filter()
                                    } label: {
                                        if viewModel.selectedStatus == viewModel.items[index] {
                                            Text(viewModel.items[index].rawValue.capitalized)
                                                .foregroundColor(.white)
                                                .font(.appFontSemiBold(size: 16))
                                                .padding(10)
                                                .padding(.horizontal, 10)
                                                .background(Color.appGreen)
                                                .cornerRadius(19)
                                        } else {
                                            Text(viewModel.items[index].rawValue.capitalized)
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
                                    .padding(.vertical, 5)
                                    .padding(.leading)
                                }
                            }
                            
                        }
                    }
                }
            }
            .background(Color.backgroundColor)
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: HStack {
                Image("logo")
                Text("My Booking")
                    .font(.appFontBold(size: 24))
                
            })
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
