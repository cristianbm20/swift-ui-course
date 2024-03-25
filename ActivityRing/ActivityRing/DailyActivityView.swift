//
//  DailyActivityView.swift
//  ActivityRing
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import SwiftUI

struct DailyActivityView: View {
  @State private var avgProgress = 0.0
  @State private var tasks = TaskStore().tasks
  
  var body: some View {
    NavigationStack {
      VStack {
        HStack {
          Text("Global Progress")
            .font(.system(.title, design: .rounded, weight: .bold))
            .foregroundStyle(.white)
          
          Spacer()
          
          ProgressRing(thickness: 12, width: 140, color: .white, gradient: Gradient(colors: [.darkPurple, .purple]), progress: $avgProgress)
          
        }
        .padding(24)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.bottom)
        
        LazyVGrid(columns: [GridItem()]) {
          ForEach(tasks.indices, id: \.self) { index in
            TaskProgressView(task: $tasks[index])
          }
        }
        
        Spacer()
      }
      .padding()
      .navigationTitle("Today's Activity")
    }
    .onAppear {
      avgProgress = tasks.reduce(0) { $0 + $1.progress } / Double(tasks.count)
    }
    .onChange(of: tasks) {
      avgProgress = tasks.reduce(0) { $0 + $1.progress } / Double(tasks.count)
    }
  }
}

struct TaskProgressView: View {
  @Binding var task: Task
  var color: Color = .lightPurple
  
  private var progressText: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.percentSymbol = "%"
    
    return formatter.string(from: NSNumber(value: task.progress)) ?? "0"
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(task.name)
          
        Text(progressText)
          .foregroundStyle(.purple)
      }
      .font(.system(.headline, design: .rounded, weight: .semibold))
      
      HStack {
        Text("0%")
        
        Slider(value: $task.progress, in: 0...1, step: 0.05)
          .tint(.purple)
        
        Text("100%")
      }
      .font(.system(.subheadline, design: .rounded))
    }
    .padding()
    .background(.blue.opacity(0.25))
    .clipShape(RoundedRectangle(cornerRadius: 24))
  }
}

#Preview {
  DailyActivityView()
}
