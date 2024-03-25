//
//  Color+Extension.swift
//  ActivityRing
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import SwiftUI

extension Color {
  public init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
    let redValue = Double(red) / 255
    let greenValue = Double(green) / 255
    let blueValue = Double(blue) / 255
    
    self.init(red: redValue, green: greenValue, blue: blueValue, opacity: alpha)
  }
  
  public static let lightRed = Color(red: 230, green: 75, blue: 60)
  public static let darkRed = Color(red: 190, green: 60, blue: 40)
  
  public static let lightGreen = Color(red: 50, green: 210, blue: 110)
  public static let darkGreen = Color(red: 35, green: 175, blue: 95)
  
  public static let lightBlue = Color(red: 50, green: 150, blue: 220)
  public static let darkBlue = Color(red: 35, green: 130, blue: 185)
  
  public static let lightPurple = Color(red: 150, green: 90, blue: 180)
  public static let darkPurple = Color(red: 140, green: 70, blue: 170)
  
  public static let lightOrange = Color(red: 230, green: 130, blue: 30)
  public static let darkOrange = Color(red: 210, green: 90, blue: 10)
  
  public static let lightYellow = Color(red: 240, green: 150, blue: 20)
  public static let darkYellow = Color(red: 230, green: 130, blue: 10)
}
