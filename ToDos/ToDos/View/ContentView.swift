//
//  ContentView.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \Task.priorityNum, order: .reverse) var tasks: [Task]
  
  // MARK: Create new task
  @State private var newTaskTitle: String = ""
  @State private var newTaskPriority: Priority = .normal
  
  @State private var showNewTask = false
  
  // MARK: Text for search
  @State private var searchText = ""
  
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
        
//        SearchBarUIKit(text: $searchText)
//          .padding(.top, -24)
        
        SearchBarSwiftUI(text: $searchText)
          .padding(.bottom, 12)
        
        if tasks.count == 0 {
          NoTaskView()
        }
        
        List {
          ForEach(tasks.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased()) })) { task in
            TaskCellView(task: task)
          }
          .onDelete(perform: { indexSet in
            deleteTask(indexSet: indexSet)
          })
        }
        .listStyle(.plain)
        .rotation3DEffect(
          Angle(degrees: showNewTask ? 8 : 0), axis: (x: 1.0, y: 0.0, z: 0.0)
        )
        .animation(.easeInOut, value: showNewTask)
        .sheet(isPresented: $showNewTask, content: {
          NewTaskView(isShow: $showNewTask, title: "", priority: .normal)
            .transition(.move(edge: .bottom))
            .animation(.interpolatingSpring(stiffness: 180.0, damping: 20.0, initialVelocity: 12.0), value: showNewTask)
            .presentationDetents([.large])
        })

      }
    }
  }
  
  private func deleteTask(indexSet: IndexSet) {
    for index in indexSet {
      let taskToDelete = tasks[index]
      modelContext.delete(taskToDelete)
    }
  }
  
}

#Preview {
  ContentView()
    .modelContainer(previewContainer)
}

@MainActor
let previewContainer: ModelContainer = {
  do {
    let container = try ModelContainer(for: Task.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for index in 1...5 {
      let newTask  = Task(title: "Task \(index)")
      container.mainContext.insert(newTask)
    }
    
    return container
  } catch {
    fatalError("Error creating the container")
  }
}()

struct NoTaskView: View {
  var body: some View {
    VStack {
      Image("empty")
        .resizable()
        .scaledToFill()
      
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

//#Preview("TaskCellView") {
//  TaskCellView(task: Task(title: "Test", priority: .normal))
//}

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
      
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(backgroundColor)
  }
}
