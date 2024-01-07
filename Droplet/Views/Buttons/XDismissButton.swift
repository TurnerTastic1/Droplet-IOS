//
//  XDismissButton.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
        .padding(.trailing, 30)
    }
}

#Preview {
    XDismissButton()
}
