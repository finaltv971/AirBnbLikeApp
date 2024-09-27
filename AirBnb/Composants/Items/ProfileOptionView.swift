//
//  ProfileOptionView.swift
//  AirBnb
//
//  Created by Anthony Baucal on 27/09/2024.
//

import SwiftUI

struct ProfileOptionView: View {
    var body: some View {
        ForEach(1..<3){ item in
            NavigationLink(value: item){
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName:"gear")
                        Text("Reglage \(item)")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName:"chevron.right")
                    }
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ProfileOptionView()
}
