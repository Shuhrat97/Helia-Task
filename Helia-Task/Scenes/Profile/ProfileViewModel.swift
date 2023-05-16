//
//  ProfileViewModel.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 14/05/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var isShow:Bool = false
    @Published var showPicker:Bool = false
    @Published var selectedImage: UIImage?
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func openCamera(){
        isShow = false
        sourceType = .camera
        showPicker = true
    }
    
    func openPhotoLibrary(){
        isShow = false
        sourceType = .photoLibrary
        showPicker = true
    }
}
