//
//  RoundedRectangle.swift
//  Figures
//
//  Created by Cristian Bermudez Martinez on 21/2/24.
//

import SwiftUI

struct RoundedRectangle: View {
  var initialPoint = CGPoint(x: 50, y: 100)
  
  var body: some View {
    VStack {
      // Shape classic method
      Path { path in
        path.move(to: initialPoint)
        path.addQuadCurve(to: CGPoint(x: 350, y: 100), control: CGPoint(x: 200, y: 40))
        path.addLine(to: CGPoint(x: 350, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.closeSubpath()
      }
      .fill(.blue)
      
      // Shape protocol
      Path { path in
        path.move(to: initialPoint)
        path.addQuadCurve(to: CGPoint(x: 350, y: 100), control: CGPoint(x: 200, y: 40))
        path.addRect(CGRect(x: 50, y: 100, width: 300, height: 50))
      }
      .fill(.green)
      
      Button {
        print("Button test has been pressed")
      } label: {
        Text("Test")
          .font(.system(.largeTitle, design: .rounded))
          .bold()
          .foregroundColor(.white)
          .frame(width: 300, height: 60)
          .background(RoundedRectangleShape().fill(.red))
      }
      
      Color.yellow
        .frame(width: 300, height: 50)
        .background(RoundedRectangleShape().fill(.yellow))
        .padding(.top, 20)
    }
    
  }
}

struct RoundedRectangleShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.move(to: CGPoint(x: 0, y: 0))
    path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width / 2, y: -0.5 * rect.size.height))
    path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
    
    return path
  }
}

#Preview {
  RoundedRectangle()
}
