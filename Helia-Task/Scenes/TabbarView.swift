//
//  TabbarView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 13/05/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(selection == 0 ? "homeSelected" : "home")
                    Text("Home")
                }
                .tag(0)
         
            SearchView()
                .tabItem {
                    Image(selection == 1 ? "searchSelected" : "search")
                    Text("Search")
                }
                .tag(1)
         
            BookingView()
                .tabItem {
                    Image(selection == 2 ? "bookingSelected" : "booking")
                    Text("Booking")
                }
                .tag(2)
         
            ProfileView()
                .tabItem {
                    Image(selection == 3 ? "profileSelected" : "profile")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(Color.appGreen)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
