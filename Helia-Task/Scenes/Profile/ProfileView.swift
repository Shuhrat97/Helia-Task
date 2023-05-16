//
//  ProfileView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 13/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @StateObject var router = UniversalRouter()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                ScrollView {
                    VStack {
                        if let image = viewModel.selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    Button {
                                        viewModel.isShow.toggle()
                                    } label: {
                                        Image("editSquare")
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottomTrailing)
                                )
                        } else {
                            Image("avatar")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    Button {
                                        viewModel.isShow.toggle()
                                    } label: {
                                        Image("editSquare")
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottomTrailing)
                                )
                        }
                        
                        Text("Daniel Austin")
                            .font(.appFontBold(size: 24))
                        
                        Text("daniel_austin@yourdomain.com")
                            .font(.appFontSemiBold(size: 14))
                            .accentColor(.black)
                        
                        Divider()
                        
                        Group {
                            NavigationLink {
                                DetailView(title: "Edit Profile")
                            } label: {
                                ProfileViewItem(type: .editProfile)
                            }
                            
                            NavigationLink {
                                DetailView(title: "Payment")
                            } label: {
                                ProfileViewItem(type: .payment)
                            }
                            
                            
                            NavigationLink {
                                DetailView(title: "Notifications")
                            } label: {
                                ProfileViewItem(type: .notifications)
                            }
                            
                            NavigationLink {
                                DetailView(title: "Security")
                            } label: {
                                ProfileViewItem(type: .security)
                            }
                            
                            NavigationLink {
                                DetailView(title: "Help")
                            } label: {
                                ProfileViewItem(type: .help)
                            }
                            
                            
                            ProfileViewItem(type: .theme)

                            
                            Button {
                                //
                            } label: {
                                ProfileViewItem(type: .logOut)
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        HStack {
                    Image("logo")
                    Text("Profile")
                        .font(.appFontBold(size: 24))
                    
                }
            )
            }
        }
        .actionSheet(isPresented: $viewModel.isShow, content: {
            var buttons:[ActionSheet.Button] = [.default(Text("Library"), action: viewModel.openPhotoLibrary),
            .cancel(Text("Close"), action: {
                self.viewModel.isShow = false
            })]
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                buttons.insert(.default(Text("Camera"), action: viewModel.openCamera), at: 0)
            }
            return ActionSheet(
                        title: Text("Action"),
                        message: nil,
                        buttons: buttons)
        })
        .sheet(isPresented: $viewModel.showPicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: viewModel.sourceType)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

fileprivate struct ProfileViewItem: View {
    @State var isDarkTheme: Bool = false
    let type:ItemType
    
    var body: some View {
        HStack {
            Image(type.icon)
                .renderingMode(.template)
            Text(type.title)
                .font(.appFontSemiBold(size: 18))
            
            if type == .theme {
                Toggle("", isOn: $isDarkTheme)
            }
        }
        .foregroundColor(type == .logOut ? .red : .black)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
    }
    
    enum ItemType {
        case editProfile
        case payment
        case notifications
        case security
        case help
        case theme
        case logOut
        
        var title: String {
            switch self {
            case .editProfile:
                return "Edit Profile"
            case .payment:
                return "Payment"
            case .notifications:
                return "Notifications"
            case .security:
                return "Security"
            case .help:
                return "Help"
            case .theme:
                return "Dark theme"
            case .logOut:
                return "Logout"
            }
        }
        
        var icon: String {
            switch self {
            case .editProfile:
                return "profile"
            case .payment:
                return "wallet"
            case .notifications:
                return "notification"
            case .security:
                return "security"
            case .help:
                return "info"
            case .theme:
                return "show"
            case .logOut:
                return "logout"
            }
        }
    }
}

fileprivate struct DetailView: View {
    let title: String
    
    var body: some View {
        Text("This is the \(title) view")
            .navigationTitle(title)
    }
}

