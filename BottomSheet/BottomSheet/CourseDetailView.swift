//
//  CourseDetailView.swift
//  BottomSheet
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct CourseDetailView: View {
  let course: Course
  
  var body: some View {
    VStack {
      HandleBar()
      TitleBar()
      HeaderView(course: course)
      ScrollView {
        DetailView(icon: "person.fill", info: course.createdBy)
        DetailView(icon: "chart.bar.fill", info: "Difficulty: \(course.difficulty)")
        Divider()
        DetailView(icon: nil, info: course.description)
        DetailView(icon: nil, info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.\nNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
      }
    }
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 16))
  }
}

struct HandleBar: View {
  var body: some View {
    Rectangle()
      .frame(width: 50, height: 10)
      .foregroundStyle(.blue)
      .clipShape(Capsule())
      .padding(.top, 6)
  }
}

struct TitleBar: View {
  var body: some View {
    HStack {
      Text("Course Details")
        .font(.system(.title2, design: .rounded, weight: .semibold))
        .foregroundStyle(.primary)
        .padding(.horizontal)
      
      Spacer()
    }
  }
}

struct HeaderView: View {
  let course: Course
  
  var body: some View {
    VStack {
      Image(course.image)
        .resizable()
        .scaledToFit()
        .frame(height: 250)
        .overlay(
          HStack {
            VStack(alignment: .leading) {
              Spacer()
              
              Text(course.name)
                .font(.system(.title, design: .rounded, weight: .semibold))
                .foregroundStyle(.white)
              
              Text(course.path)
                .font(.system(.subheadline, design: .rounded, weight: .semibold))
                .padding(4)
                .foregroundStyle(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Spacer()
          }
            .padding(28)
        )
    }
  }
}

struct DetailView: View {
  let icon: String?
  let info: String
  
  var body: some View {
    HStack {
      if icon != nil {
        Image(systemName: icon!)
      }
      
      Text(info)
      
      Spacer()
    }
    .padding(.horizontal)
  }
}

#Preview {
  CourseDetailView(course: CourseFactory().courses[0])
}
