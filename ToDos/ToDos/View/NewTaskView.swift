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
    VStack(alignment: .leading) {
      HStack {
        Text("Add a new task")
          .font(.system(.title, design: .rounded, weight: .bold))
        
        Spacer()
        
        Button {
          isShow = false
        } label: {
          Image(systemName: "xmark")
            .font(.system(.title2, weight: .bold))
        }
      }
      
      HStack {
        TextField("Task description", text: $title)
          .font(.system(.headline))
      }
      .padding(.top, 24)
      
      Divider()
        .background(.black)
      
      HStack {
        Text("Priority")
          .font(.system(.title3, design: .rounded, weight: .semibold))
        
        Spacer()
        
        Button {
          
        } label: {
          Text("Low")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(.green)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        
        Button {
          
        } label: {
          Text("Normal")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(.orange)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        
        Button {
          
        } label: {
          Text("High")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(.red)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
      }
      .padding([.bottom, .top], 24)
      
      Button {
        print("pressed")
      } label: {
        Text("Create Task")
          .font(.system(.title3, design: .rounded, weight: .semibold))
          .frame(minWidth: 0, maxWidth: .infinity)
          .padding(12)
          .foregroundColor(.white)
          .background(.blue)
          .clipShape(RoundedRectangle(cornerRadius: 12))
      }
      
      
      
      
    }
    .padding(24)
    
  }
}

#Preview {
  NewTaskView(isShow: .constant(true), tasks: .constant([]), title: "", priority: .normal)
}
