//
//  brandButton.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct brandButton: View {
    
    var title: LocalizedStringKey
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .padding(30)
    }
}

#Preview {
    brandButton(title: "test", width: 80, height: 20)
}
