//
//  Profile.swift
//  AirBnb
//
//  Created by Anthony Baucal on 26/09/2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            VStack(alignment:.leading,spacing: 32){
                VStack(alignment: .leading,spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Login")
                    
                }
                
                Button{
                    
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                HStack{
                    Text("Pas de compte?")
                    
                    Text("S'inscrire")
                        .fontWeight(.semibold)
                        .underline()
                }.font(.caption)
            }
            
            VStack(spacing:24){
                ProfileOptionView()
            }.padding(.vertical)
            
        }.padding()
    }
}

#Preview {
    Profile()
}
