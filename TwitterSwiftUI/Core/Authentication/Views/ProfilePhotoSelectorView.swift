//
//  PhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/3/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(header1: "Set up your account",
                           header2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .padding(44)
                        .frame(width: 180, height: 180)
                }
            }
            .overlay(Circle().strokeBorder(lineWidth: 8))
            .foregroundColor(Color(.systemBlue))
            .frame(width: 220, height: 220)
            .padding(.vertical, 44)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage) {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule()
                        )
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage () {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
