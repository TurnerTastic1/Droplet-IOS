//
//  testing.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import SwiftUI

struct testing: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Button("Start Progress") {
                withAnimation(.linear(duration: 2.0)) {
                    progress = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation(.linear(duration: 0.1)) {
                        progress = 0.0
                    }
                }
            }
            
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.secondary)
                    .overlay(
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geometry.size.width * progress)
                            .clipped()
                    )
                    .frame(height: 2)
                    .offset(y: 325)
            }
        }
    }
}

#Preview {
    testing()
}
