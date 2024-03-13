//
//  ContentView.swift
//  Buttons
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Spacer()
      
      // Modern syntax
      Button {
        print("Modern button has been pressed")
      } label: {
        Text("Modern Button")
          .font(.system(.title, design: .rounded))
          .fontWeight(.bold)
          .padding(12)
          .background(Color.green)
          .cornerRadius(12)
          .foregroundColor(.white)
          .padding(8)
          .overlay {
            RoundedRectangle(cornerRadius: 18)
              .stroke(.green, lineWidth: 6)
          }
      }
      
      Spacer()
      
      // Classic syntax
      Button(action: {
        print("Classic button has been pressed")
      }, label: {
        Text("Classic Button")
          .padding()
          .border(.blue, width: 2)
      })
      
      Spacer()
      
      // Buttons with image, gradient and shadow
      Button {
        print("Button Edit has been pressed")
      } label: {
        Label(
          title: {
            Text("Edit")
              .font(.system(.title, design: .rounded))
              .fontWeight(.semibold)
          },
          icon: {
            Image(systemName: "pencil")
              .font(.largeTitle)
          }
        )
      }
      .buttonStyle(GradientButtonStyle(color1: "Jodhpur 1", color2: "Jodhpur 2"))
      
      Spacer()
      
      Button {
        print("Button Share has been pressed")
      } label: {
        Label(
          title: {
            Text("Share")
              .font(.system(.title, design: .rounded))
              .fontWeight(.semibold)
          },
          icon: {
            Image(systemName: "square.and.arrow.up")
              .font(.largeTitle)
          }
        )
      }
      .buttonStyle(GradientButtonStyle(color1: "Easymed 1", color2: "Easymed 2"))
      
      Spacer()
      
      Button {
        print("Button Delete has been pressed")
      } label: {
        Label(
          title: {
            Text("Delete")
              .font(.system(.title, design: .rounded))
              .fontWeight(.semibold)
          },
          icon: {
            Image(systemName: "trash")
              .font(.largeTitle)
          }
        )
      }
      .buttonStyle(GradientButtonStyle(color1: "Burning 1", color2: "Burning 2"))
      
      Spacer()
      
      Button {
        print("Button Plus has been pressed")
      } label: {
        Image(systemName: "plus")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
      .buttonStyle(PlusButtonStyle())
    }
    .padding(.horizontal, 24)
  }
}

struct GradientButtonStyle: ButtonStyle {
  let color1: String
  let color2: String
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
      .foregroundColor(.white)
      .padding()
      .background(LinearGradient(colors: [Color(color1), Color(color2)], startPoint: .trailing, endPoint: .leading))
      .cornerRadius(32)
      .shadow(color: .gray ,radius: 10, x: 10, y: 10)
      .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
  }
}

struct PlusButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(.white)
      .padding()
      .background(Color.blue)
      .clipShape(Circle())
      .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
  }
}

#Preview {
  ContentView()
}
