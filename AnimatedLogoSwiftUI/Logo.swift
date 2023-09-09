//
//  Logo.swift
//  AnimatedLogoSwiftUI
//
//  Created by Fardan Akhter on 03/09/2023.
//

import SwiftUI

extension Animation {
    fileprivate static var custom: Animation {
        .easeOut(duration: 3.0)
        .speed(0.9)
        .delay(1.0)
    }
}

struct Logo: View {
    
    var pathProgress: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                
                let spacing = 8.0
                let width = min(proxy.size.width, proxy.size.height)
                
                let center = CGPoint(
                    x: proxy.size.width * 0.5,
                    y: proxy.size.height * 0.5
                )
                
                let centerPeakPoint = CGPoint(
                    x: center.x,
                    y: center.y - (width * 0.25)
                )
                let leftPeakPoint = CGPoint(
                    x: center.x - (width * 0.15),
                    y: center.y - (width * 0.15)
                )
                let rightPeakPoint = CGPoint(
                    x: center.x + (width * 0.15),
                    y: center.y - (width * 0.15)
                )

                // left mountain
                path.move(to: .init(x: leftPeakPoint.x - (width * 0.17),
                                    y: center.y + (width * 0.2)))
                path.addLine(to: leftPeakPoint)
                path.addLine(to: .init(x: leftPeakPoint.x + (width * 0.05),
                                       y: center.y - (width * 0.03)))
                
                // center mountain
                path.move(to: .init(x: center.x - (width * 0.2),
                                    y: center.y + (width * 0.2)))
                path.addLine(to: centerPeakPoint)
                path.addLine(to: .init(x: center.x + (width * 0.2),
                                       y: center.y + (width * 0.2)))


                // right mountain
                path.move(to: .init(x: rightPeakPoint.x - (width * 0.05),
                                    y: center.y - (width * 0.03)))
                path.addLine(to: rightPeakPoint)
                path.addLine(to: .init(x: rightPeakPoint.x + (width * 0.17),
                                       y: center.y + (width * 0.2)))
                
                // circle
                path.move(to: .init(
                    x: center.x + (width / 2) - spacing,
                    y: center.y)
                )

                path.addArc(center: center,
                            radius: (width / 2) - spacing,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 360),
                            clockwise: true)
                
                // left dashes
                path.move(to: .init(x: center.x - (width * 0.08),
                                    y: center.y + (width * 0.08)))
                path.addLine(to: .init(x: center.x - (width * 0.33),
                                       y: center.y + (width * 0.08)))
                
                // right dashes
                path.move(to: .init(x: center.x + (width * 0.2),
                                    y: center.y - (width * 0.05)))
                path.addLine(to: .init(x: center.x + (width * 0.3),
                                       y: center.y - (width * 0.05)))
            }
            .trim(from: 0.0, to: pathProgress)
            .stroke(.white, lineWidth: 5.0)
            .animation(.custom, value: pathProgress)
        }
    }
}

struct Logo_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Logo(pathProgress: 1.0)
            .background(.black)
            .previewLayout(.fixed(width: 200, height: 200))
            .previewDisplayName("Compact Width, Compact Height")

        Logo(pathProgress: 1.0)
            .background(.black)
            .previewLayout(.fixed(width: 200, height: 400))
            .previewDisplayName("Compact Width")

        Logo(pathProgress: 1.0)
            .background(.black)
            .previewLayout(.fixed(width: 400, height: 200))
            .previewDisplayName("Compact Height")   
    }
}
