//
//  SearchBarUIKit.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 14/3/24.
//

import SwiftUI

#Preview {
  SearchBarUIKit(text: .constant(""))
}

struct SearchBarUIKit: UIViewRepresentable {
  @Binding var text: String
  
  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar()
    
    searchBar.searchBarStyle = .minimal
    searchBar.autocapitalizationType = .none
    searchBar.placeholder = "Search"
    searchBar.delegate = context.coordinator
    
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: Context) {
    uiView.text = text
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(text: $text)
  }
  
  class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    
    init(text: Binding<String>) {
      _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      searchBar.showsCancelButton = true
      text = searchText
      
      print("New text is \(text)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      text = ""
      searchBar.resignFirstResponder()
      searchBar.showsCancelButton = false
      searchBar.endEditing(true)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
      searchBar.showsCancelButton = true
      
      return true
    }
    
  }
  
}
