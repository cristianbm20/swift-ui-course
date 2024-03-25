//
//  ProgressRing.swift
//  ActivityRing
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import SwiftUI

struct ProgressRing: View {
  var thickness: CGFloat = 20.0
  var width: CGFloat
  var color: Color
  var gradient: Gradient
  let startAngle: Double = -90
  let circleThreshold = 0.95
  
  @Binding var progress: Double
  
  private var radius: Double {
    Double(width / 2)
  }
  
  private func ringEndPosition(progress: Double) -> CGPoint {
    let endAngle = 360 * progress + startAngle
    let endAngleRadians = endAngle * .pi / 360
    
    return CGPoint(x: radius * cos(endAngleRadians), y: radius * sin(endAngleRadians))
  }
  
  private var ringEndShadowOffset: CGPoint {
    let shadowPosition = ringEndPosition(progress: progress + 0.02)
    let circlePosition = ringEndPosition(progress: progress)
    
    return CGPoint(x: shadowPosition.x - circlePosition.x, y: shadowPosition.y - circlePosition.y)
  }
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(color.opacity(0.25), lineWidth: thickness)
      
      RingShape(progress: progress, thickness: thickness)
        .fill(AngularGradient(gradient: gradient, center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360 * progress + startAngle)))
        .animateProgressText(progress: progress, textColor: color)
      
      RingEnd(progress: progress, startAngle: startAngle, ringRadius: radius)
        .frame(width: thickness, height: thickness)
        .foregroundStyle(progress > circleThreshold ? gradient.stops[1].color : Color.clear)
        .shadow(color: progress > circleThreshold ? .black.opacity(0.1) : Color.clear, radius: 14, x: ringEndShadowOffset.x, y: ringEndShadowOffset.y)
    }
    .frame(width: width, height: width, alignment: .center)
    .animation(.easeInOut(duration: 1), value: progress)
  }
}

struct RingShape: Shape {
  var progress: Double = 0.0
  var thickness: CGFloat = 25.0
  let startAngle: Double = -90
  
  var animatableData: Double {
    get { progress }
    set { progress = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    let radius = min(rect.width, rect.height) / 2
    
    path.addArc(center: center, radius: radius, startAngle: .degrees(startAngle), endAngle: .degrees(360 * progress + startAngle), clockwise: false)
    
    return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
  }
}

struct RingEnd: Shape {
  var progress: Double = 0.0
  var startAngle: Double = -90
  var ringRadius: Double
  
  var animatableData: Double {
    get { progress }
    set { progress = newValue }
  }
  
  private var position: CGPoint {
    let endAngle = 360 * progress + startAngle
    let endAngleRadians = endAngle * .pi / 180
    
    let x = ringRadius * cos(endAngleRadians)
    let y = ringRadius * sin(endAngleRadians)
    
    return CGPoint(x: x, y: y)
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    guard progress > 0.0 else {
      return path
    }
    
    let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)
    
    path.addRoundedRect(in: frame, cornerSize: frame.size)
    
    return path
  }
}

struct ProgressText: ViewModifier, Animatable {
  var progress: Double = 0
  var textColor: Color = .primary
  
  private var progressText: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.percentSymbol = "%"
    
    return formatter.string(from: NSNumber(value: progress)) ?? "0%"
  }
  
  var animatableData: Double {
    get { progress }
    set { progress = newValue }
  }
  
  func body(content: Content) -> some View {
    content
      .overlay(
        Text(progressText)
          .font(.system(.largeTitle, design: .rounded, weight: .semibold))
          .foregroundStyle(textColor)
          .animation(nil)
      )
  }
  
}

extension View {
  func animateProgressText(progress: Double, textColor: Color = .primary) -> some View {
    modifier(ProgressText(progress: progress, textColor: textColor))
  }
}

// Add to Library Content Provider
struct ProgressRing_Library: LibraryContentProvider {
  @LibraryContentBuilder
  var views: [LibraryItem] {
    LibraryItem(ProgressRing(thickness: 15, width: 150, color: .darkRed, gradient: Gradient(colors: [.darkRed, .lightRed]), progress: .constant(1)), title: "Progress Ring", category: .control)
  }
  
  @LibraryContentBuilder
  func modifiers(base: Circle) -> [LibraryItem] {
    LibraryItem(base.animateProgressText(progress: 1), title: "Progress Text", category: .control)
  }
}

#Preview ("ProgressRing 50%") {
  ProgressRing(width: 250, color: .darkRed, gradient: Gradient(colors: [.darkRed, .lightRed]), progress: .constant(0.5))
}

#Preview ("ProgressRing 90%") {
  ProgressRing(width: 250, color: .darkGreen, gradient: Gradient(colors: [.darkGreen, .lightGreen]), progress: .constant(0.9))
}

#Preview ("ProgressRing 150%") {
  ProgressRing(width: 250, color: .darkBlue, gradient: Gradient(colors: [.darkBlue, .lightBlue]), progress: .constant(1.5))
}
