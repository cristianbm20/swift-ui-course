//
//  RegistrationViewModel.swift
//  Register
//
//  Created by Cristian Bermudez Martinez on 6/3/24.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
  // Input
  @Published var username = ""
  @Published var password = ""
  @Published var passwordValidation = ""
  
  // Validations
  @Published var isUsernameLengthValid = false
  @Published var isPasswordLengthValid = false
  @Published var isPasswordNumberValid = false
  @Published var isPasswordCapitalValid = false
  @Published var isPasswordsMatch = false
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  init() {
    $username
      .receive(on: RunLoop.main)
      .map { username in
        return username.count >= 3
      }
      .assign(to: \.isUsernameLengthValid, on: self)
      .store(in: &cancellableSet)
    
    $password
      .receive(on: RunLoop.main)
      .map { password in
        return password.count >= 6
      }
      .assign(to: \.isPasswordLengthValid, on: self)
      .store(in: &cancellableSet)
    
    $password
      .receive(on: RunLoop.main)
      .map { password in
        let pattern = "[0-9]"
        if let _ = password.range(of: pattern, options: .regularExpression) {
          return true
        } else {
          return false
        }
      }
      .assign(to: \.isPasswordNumberValid, on: self)
      .store(in: &cancellableSet)
    
    $password
      .receive(on: RunLoop.main)
      .map { password in
        let pattern = "[A-Z]"
        if let _ = password.range(of: pattern, options: .regularExpression) {
          return true
        } else {
          return false
        }
      }
      .assign(to: \.isPasswordCapitalValid, on: self)
      .store(in: &cancellableSet)
    
    Publishers.CombineLatest($password, $passwordValidation)
      .receive(on: RunLoop.main)
      .map { password1, password2 in
        return !password1.isEmpty && !password2.isEmpty && (password1 == password2)
      }
      .assign(to: \.isPasswordsMatch, on: self)
      .store(in: &cancellableSet)
  }
}
