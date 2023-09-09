//
//  ContentView.swift
//  AnimatedLogoSwiftUI
//
//  Created by Fardan Akhter on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimated = false
    @State private var progress = 0.0
    
    var body: some View {
        ZStack {
            GalaxyOfStars(shouldAnimate: isAnimated)
                .blur(radius: isAnimated ? 0.0 : 1.0)
            Logo(pathProgress: progress)
                .frame(width: 360)
                .shadow(color: .white, radius: isAnimated ? 2.5 : 1.0)
        }
        .onAppear {
            isAnimated.toggle()
            progress = 1.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
