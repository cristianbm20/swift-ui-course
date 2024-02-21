//
//  ContentView.swift
//  Figures
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct ContentView: View {
  var drawTriangle = false
  let controlPoint = CGPoint(x: 200, y: 350)
  
  var body: some View {
    ZStack {
      Path() { path in
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 350, y: 50))
        path.addLine(to: CGPoint(x: 350, y: 220))
        path.addLine(to: CGPoint(x: 300, y: 220))
        
        path.addQuadCurve(to: CGPoint(x: 50, y: 220), control: controlPoint)
        
        if drawTriangle {
          path.addLine(to: CGPoint(x: 300, y: 220))
          path.addLine(to: controlPoint)
          path.addLine(to: CGPoint(x: 100, y: 220))
        }
        
        path.addLine(to: CGPoint(x: 50, y: 220))
        path.closeSubpath()
        
      }
      .fill(.green)
      
      
      Path() { path in
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 350, y: 50))
        path.addLine(to: CGPoint(x: 350, y: 220))
        path.addLine(to: CGPoint(x: 300, y: 220))
        
        path.addQuadCurve(to: CGPoint(x: 100, y: 220), control: controlPoint)
        
        if drawTriangle {
          path.addLine(to: CGPoint(x: 300, y: 220))
          path.addLine(to: controlPoint)
          path.addLine(to: CGPoint(x: 100, y: 220))
        }
        
        path.addLine(to: CGPoint(x: 50, y: 220))
        path.closeSubpath()
        
      }
      .stroke(.blue, lineWidth: 8)
    }
    
  }
}

#Preview {
  ContentView()
}
