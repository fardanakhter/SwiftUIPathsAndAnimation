//
//  GalaxyOfStars.swift
//  AnimatedLogoSwiftUI
//
//  Created by Fardan Akhter on 03/09/2023.
//

import SwiftUI

struct GalaxyOfStars: View {
    
    private let colors: [Color] = [
        Color(red: 40/255, green: 31/255, blue: 57/255),
        Color(red: 52/255, green: 58/255, blue: 73/255),
        Color(red: 92/255, green: 140/255, blue: 110/255),
        Color(red: 94/255, green: 173/255, blue: 162/255),
    ]
    
    @State var shouldAnimate = false
    @State private var startPoint: UnitPoint = .init(x: 1.0, y: 0.0)
    @State private var endPoint: UnitPoint = .init(x: -4.0, y: 2.0)
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
                    .animation(.easeInOut(duration: 2.0).delay(1.5), value: shouldAnimate)
                ForEach(0..<50) { _ in
                    SparklingStar(fillColor: [.white, .yellow][Int.random(in: 0..<2)])
                        .frame(height: 2.0)
                        .position(.init(x: CGFloat.random(in: 10..<proxy.size.width - 10), y: CGFloat.random(in: 10..<proxy.size.height - 10)))
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            endPoint = .init(x: 0.0, y: 1.0)
            shouldAnimate = true
        }
    }
}

struct GalaxyOfStars_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyOfStars()
    }
}
