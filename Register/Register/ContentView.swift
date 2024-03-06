//
//  ContentView.swift
//  Register
//
//  Created by Cristian Bermudez Martinez on 6/3/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var viewModel = RegistrationViewModel()
  
  var body: some View {
    VStack {
      Image(systemName: "person.crop.circle")
        .font(.system(size: 132))
        .padding(.bottom, 12)
        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.blue]), startPoint: .leading, endPoint: .trailing))
      
      Text("Create New Account")
        .font(.system(.largeTitle, design: .rounded, weight: .bold))
        .padding(.bottom, 18)
      
      FormView(fieldName: "Username", fieldValue: $viewModel.username)
      RequirementText(iconName: viewModel.isUsernameLengthValid ? "lock.open" : "lock", iconColor: viewModel.isUsernameLengthValid ? .green : .red , requirementText: "Must be at least 3 characters")
        .padding()
      
      FormView(fieldName: "Password", fieldValue: $viewModel.password, isSecure: true)
      VStack {
        RequirementText(iconName: viewModel.isPasswordLengthValid ? "lock.open" : "lock", iconColor: viewModel.isPasswordLengthValid ? .green : .red, requirementText: "Must be at least 6 characters", isVerified: viewModel.isPasswordLengthValid)
        RequirementText(iconName: viewModel.isPasswordNumberValid ? "lock.open" : "lock", iconColor: viewModel.isPasswordNumberValid ? .green : .red, requirementText: "Must contain at least a number", isVerified: viewModel.isPasswordNumberValid)
        RequirementText(iconName: viewModel.isPasswordCapitalValid ? "lock.open" : "lock", iconColor: viewModel.isPasswordCapitalValid ? .green : .red, requirementText: "Must contain at least a capital letter", isVerified: viewModel.isPasswordCapitalValid)
      }
      .padding()
      
      FormView(fieldName: "Repeat Password", fieldValue: $viewModel.passwordValidation, isSecure: true)
      RequirementText(iconName: viewModel.isPasswordsMatch ? "lock.open" : "lock", iconColor: viewModel.isPasswordsMatch ? .green : .red, requirementText: "Passwords must match", isVerified: viewModel.isPasswordsMatch)
        .padding()
        .padding(.bottom, 48)
      
      Button {
        
      } label: {
        Text("Register")
          .font(.system(.headline, design: .rounded, weight: .bold))
          .foregroundStyle(.white)
          .padding()
          .frame(minWidth: 0, maxWidth: .infinity)
          .background(LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.blue]), startPoint: .leading, endPoint: .trailing))
          .clipShape(RoundedRectangle(cornerRadius: 16))
      }
      .padding([.horizontal, .bottom])
      
      HStack {
        Text("Already have an account?")
          .font(.system(.callout, design: .rounded, weight: .semibold))
        
        Button {
          // TODO: Goes to login view
        } label: {
          Text("Log In")
            .font(.system(.callout, design: .rounded, weight: .semibold))
        }
      }
      
    }
    .padding()
  }
}

struct RequirementText: View {
  var iconName = "lock"
  var iconColor = Color(.red)
  var requirementText = ""
  var isVerified = false
  
  var body: some View {
    HStack {
      Image(systemName: iconName)
        .foregroundStyle(iconColor)
      
      Text(requirementText)
        .font(.system(.body, design: .rounded))
        .foregroundStyle(.secondary)
        .strikethrough(isVerified)
      
      Spacer()
    }
    
  }
}

struct FormView: View {
  var fieldName = ""
  @Binding var fieldValue: String
  var isSecure = false
  
  var body: some View {
    VStack {
      if isSecure {
        SecureField("\(Image(systemName: "key.fill")) \(fieldName)", text: $fieldValue)
          .font(.system(size: 16, weight: .semibold, design: .rounded))
          .padding(.horizontal)
      } else {
        TextField("\(Image(systemName: "person.fill")) \(fieldName)", text: $fieldValue)
          .font(.system(size: 16, weight: .semibold, design: .rounded))
          .padding(.horizontal)
      }
      
      Divider()
        .frame(height: 1)
        .background(.secondary)
        .padding(.horizontal)
    }
    
  }
}

#Preview {
  ContentView()
}
