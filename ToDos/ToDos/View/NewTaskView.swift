//
//  NewTaskView.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI

struct NewTaskView: View {
  @Binding var isShow: Bool
  @Binding var tasks: [Task]
  
  @State var title: String
  @State var priority: Priority
  @State var isEditing = false
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  NewTaskView(isShow: .constant(true), tasks: .constant([]), title: "", priority: .normal)
}
