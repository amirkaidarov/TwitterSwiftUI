//
//  AuthenticationHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/2/23.
//

import SwiftUI

struct AuthHeaderView: View {
    var header1 : String
    var header2 : String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{Spacer()}
            
            Text(header1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(header2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
          
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(header1: "Hello,", header2: "WelcomeB ack")
    }
}
