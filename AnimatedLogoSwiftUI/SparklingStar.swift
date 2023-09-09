//
//  SparklingStar.swift
//  AnimatedLogoSwiftUI
//
//  Created by Fardan Akhter on 03/09/2023.
//

import SwiftUI

struct SparklingStar: View {
    let fillColor: Color
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
                let width = min(proxy.size.height, proxy.size.width)
                path.addArc(center: center, radius: width / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
            .fill(fillColor)
            .shadow(color: fillColor, radius: 15.0)
        }
    }
}

struct SparklingStar_Previews: PreviewProvider {
    
    static let color1 = Color(red: 255/255, green: 119/255, blue: 103/255)
    
    static var previews: some View {
        SparklingStar(fillColor: .yellow)
            .frame(width: 20)
    }
}
