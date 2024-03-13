//
//  ContentView.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @State var tasks: [Task] = []
  
  // MARK: Create new task
  @State private var newTaskTitle: String = ""
  @State private var newTaskPriority: Priority = .normal
  
  @State private var showNewTask = false
  
  var body: some View {
    ZStack {
      VStack {
        HStack {
          Text("Task List")
            .font(.system(.title, design: .rounded, weight: .bold))
          
          Spacer()
          
          Button {
            showNewTask = true
          } label: {
            Image(systemName: "plus")
              .font(.system(.title, weight: .bold))
              .foregroundStyle(.blue)
          }
        }
        .padding()
        
        List {
          ForEach(tasks) { task in
            TaskCellView(task: task)
          }
        }
        .listStyle(.plain)
        .rotation3DEffect(
          Angle(degrees: showNewTask ? 8 : 0), axis: (x: 1.0, y: 0.0, z: 0.0)
        )
        .offset(y: showNewTask ? -40 : 0)
        .animation(.easeInOut, value: showNewTask)
        .onAppear {
          UITableView.appearance().separatorColor = .clear
        }
        
        if tasks.count == 0 {
          NoTaskView()
        }
        
        if showNewTask {
          BlankView(backgroundColor: .gray)
            .opacity(0.4)
            .onTapGesture {
              showNewTask = false
            }
          
          NewTaskView(isShow: $showNewTask, tasks: $tasks, title: "", priority: .normal)
            .transition(.move(edge: .bottom))
            .animation(.interpolatingSpring(stiffness: 180.0, damping: 20.0, initialVelocity: 12.0), value: showNewTask)
        }
        
      }
    }
  }
  
}

#Preview {
  ContentView()
}

struct NoTaskView: View {
  var body: some View {
    VStack {
      Image("empty")
        .resizable()
        .scaledToFit()
      
      Text("There are no pending tasks. Press the button in the upper left corner to create one.")
        .font(.system(.headline, design: .rounded))
        .padding()
    }
    
  }
}

#Preview("NoTaskView") {
  NoTaskView()
}

struct TaskCellView: View {
  @Bindable var task: Task
  
  var body: some View {
    Toggle(isOn: $task.isCompleted, label: {
      HStack {
        Text(task.title)
          .font(.system(.callout, design: .rounded, weight: .bold))
          .strikethrough(task.isCompleted)
          .animation(.default)
        
        Spacer()
        Circle()
          .frame(width: 16)
          .foregroundStyle(task.priority.color())
      }
    })
    .toggleStyle(CheckBoxStyle())
  }
}

#Preview("TaskCellView") {
  TaskCellView(task: Task(title: "Test", priority: .normal))
}

struct CheckBoxStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundStyle(configuration.isOn ? .green : .gray)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .onTapGesture {
          configuration.isOn.toggle()
        }
      
      configuration.label
    }
  }
}

struct BlankView: View {
  var backgroundColor: Color
  
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(backgroundColor)
    .edgesIgnoringSafeArea(.all)
  }
}
