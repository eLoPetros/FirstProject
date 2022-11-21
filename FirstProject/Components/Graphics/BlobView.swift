//
//  BlobView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 12.11.2022.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 45)
            let x = cos(angle.radians)
            let angele2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle.radians)
            
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.pink, .blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 250)))
            }
            .frame(width: 330, height: 330)
            .rotationEffect(.degrees(appear ? 360 : 0))
        }
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
                appear = true
            }
        }
    }
    
    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.98617*width, y: 0.46722*height))
        path.addCurve(to: CGPoint(x: 0.65516*width * x2, y: 0.9968*height), control1: CGPoint(x: 1.04535*width, y: 0.7315*height), control2: CGPoint(x: 0.88153*width, y: 0.95187*height))
        path.addCurve(to: CGPoint(x: 0.00348*width, y: 0.54769*height), control1: CGPoint(x: 0.40224*width * x, y: 1.00394*height), control2: CGPoint(x: 0.0121*width , y: 0.78548*height))
        path.addCurve(to: CGPoint(x: 0.49129*width, y: 0.08*height * x), control1: CGPoint(x: -0.03059*width, y: 0.28083*height * x), control2: CGPoint(x: 0.39373*width, y: 0.13538*height * x))
        path.addCurve(to: CGPoint(x: 0.98617*width, y: 0.46722*height), control1: CGPoint(x: 1.05575*width, y: -0.16108*height * x2), control2: CGPoint(x: 0.92978*width, y: 0.2154*height))
        path.closeSubpath()
        return path
    }
}


struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}




