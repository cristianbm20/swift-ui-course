//
//  Arcs.swift
//  Figures
//
//  Created by Cristian Bermudez Martinez on 21/2/24.
//

import SwiftUI

struct Arcs: View {
  let initialPoint = CGPoint(x:200, y: 250)
  var body: some View {
    ZStack {
      Path() { path in
        path.move(to: initialPoint)
        path.addArc(center: initialPoint, radius: 100, startAngle: .degrees(0), endAngle: .degrees(200), clockwise: true)
      }
      .fill(.blue)
      
      Path() { path in
        path.move(to: initialPoint)
        path.addArc(center: initialPoint, radius: 100, startAngle: .degrees(200), endAngle: .degrees(120), clockwise: true)
      }
      .fill(.yellow)
      .offset(x: -10, y: 3)
      
      Path() { path in
        path.move(to: initialPoint)
        path.addArc(center: initialPoint, radius: 100, startAngle: .degrees(120), endAngle: .degrees(90), clockwise: true)
      }
      .fill(.green)
      
      Path() { path in
        path.move(to: initialPoint)
        path.addArc(center: initialPoint, radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
        path.closeSubpath()
      }
      .fill(.red)
      .overlay(
        Text("25%")
          .font(.system(.title2, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .offset(x: 50, y: -95)
      )
      
      Path() { path in
        path.move(to: initialPoint)
        path.addArc(center: initialPoint, radius: 100, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
        path.closeSubpath()
      }
      .stroke(.black, lineWidth: 2)
    }
    
    
  }
}

#Preview {
  Arcs()
}
