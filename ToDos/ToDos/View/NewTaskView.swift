//
//  NewTaskView.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI

struct NewTaskView: View {
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.modelContext) private var modelContext
  @Binding var isShow: Bool
  
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
      
      TextField("Task description", text: $title) { editingChanged in
        isEditing = editingChanged
      }
      .font(.system(.headline))
      .padding(12)
      .background(colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray5))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      
      HStack {
        Text("Priority")
          .font(.system(.title3, design: .rounded, weight: .semibold))
        
        Spacer()
        
        Button {
          priority = .low
        } label: {
          Text("Low")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(priority == .low ? Priority.low.color() : Color(.systemGray2))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        
        Button {
          priority = .normal
        } label: {
          Text("Normal")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(priority == .normal ? Priority.normal.color() : Color(.systemGray2))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        
        Button {
          priority = .high
        } label: {
          Text("High")
            .font(.system(.body, design: .rounded, weight: .semibold))
        }
        .tint(priority == .high ? Priority.high.color() : Color(.systemGray2))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
      }
      .padding([.bottom, .top], 24)
      
      Button {
        if title.trimmingCharacters(in: .whitespaces) == "" {
          return
        }
        
        isShow = false
        let newTask = Task(title: title, priority: priority, isCompleted: false)
        modelContext.insert(newTask)
      } label: {
        Text("Save Task")
          .font(.system(.title3, design: .rounded, weight: .semibold))
          .frame(minWidth: 0, maxWidth: .infinity)
          .padding(12)
          .foregroundColor(.white)
          .background(.blue)
          .clipShape(RoundedRectangle(cornerRadius: 12))
      }

    }
    .padding(24)
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .offset(y: isEditing ? -80 : -220)
    .edgesIgnoringSafeArea(.bottom)
    
  }
  
}

#Preview {
  NewTaskView(isShow: .constant(true),  title: "", priority: .normal)
}
