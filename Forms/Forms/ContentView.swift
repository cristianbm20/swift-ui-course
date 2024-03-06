//
//  ContentView.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 29/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var courses = [
    Course(name: "Linear Algebra", image: "linear-algebra", createdBy: "John Doe", difficulty: 3, description: "Linear algebra course", price: 19.99),
    Course(name: "Calculation", image: "calculation", createdBy: "Jane Roe", difficulty: 4, description: "Calculation course", price: 39.99),
    Course(name: "Descriptive Statistics", image: "descriptive-statistics", createdBy: "Richard Roe", difficulty: 1, description: "Descriptive statistics course", price: 14.99),
    Course(name: "Inferential Statistics", image: "inferential-statistics", createdBy: "John Doe", difficulty: 5, description: "Inferential statistics course", price: 9.99),
    Course(name: "Discrete Mathematics", image: "discrete-mathematics", createdBy: "Richard Roe", difficulty: 2, description: "Discrete mathematics course", price: 29.99),
    Course(name: "Probability", image: "probability", createdBy: "Jane Q. Public", difficulty: 2, description: "Probability course", price: 34.99),
    Course(name: "Latex", image: "latex", createdBy: "Joe Bloggs", difficulty: 4, description: "Latex course", price: 4.99),
    Course(name: "Sage", image: "sage", createdBy: "Joe Public", difficulty: 3, description: "Sage course", price: 8.99),
    Course(name: "Selectivity", image: "selectivity", createdBy: "Joe Public", difficulty: 2, description: "Selectivity course", price: 12.99),
    Course(name: "Swift 5", image: "swift5", createdBy: "Joe Sixpack", difficulty: 4, description: "Swift 5 course", price: 49.99),
    Course(name: "iOS 10 Course", image: "ios10", createdBy: "Average Joe", difficulty: 3, description: "iOS 10 course", price: 21.99),
    Course(name: "iOS 11 Course", image: "ios11", createdBy: "Average Joe", difficulty: 1, description: "iOS 11 course", price: 54.99),
    Course(name: "iOS 12 Course", image: "ios12", createdBy: "Joe Sixpack", difficulty: 4, description: "iOS 12 course", price: 59.99),
    Course(name: "Swift UI Course", image: "ios13", createdBy: "Jane Q. Public", difficulty: 4, description: "Swift UI course", price: 44.99)
  ]
  
  @State private var selectedCourse: Course?
  @State private var showSettings = false
  
  @EnvironmentObject var settings: SettingsFactory
  
  // Navbar customization with UIKit
  init() {
    let navbarAppearance = UINavigationBarAppearance()
    
    navbarAppearance.largeTitleTextAttributes = [
      .foregroundColor: UIColor.systemBlue,
      .font: UIFont(name: "ArialRoundedMTBold", size: 30)!
    ]
    
    navbarAppearance.titleTextAttributes = [
      .foregroundColor: UIColor.systemBlue,
      .font: UIFont(name: "ArialRoundedMTBold", size: 21)!
    ]
    
    UINavigationBar.appearance().standardAppearance = navbarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
    UINavigationBar.appearance().compactAppearance = navbarAppearance
    
    navbarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.backward"), transitionMaskImage: UIImage(systemName: "arrow.backward"))
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(courses.sorted(by: DisplayOrder(type: settings.displayOrder).sortPredicate())) { course in
          if shouldShow(course: course) {
            NavigationLink(destination: CourseDetailView(course: course)) {
              InfoImageRow(course: course)
                .contextMenu {
                  if !course.isPurchased {
                    Button {
                      purchase(course: course)
                    } label: {
                      HStack {
                        Image(systemName: "dollarsign")
                        Text("Buy")
                      }
                    }
                  }
                  
                  Button {
                    favourite(course: course)
                  } label: {
                    HStack {
                      Image(systemName: "star.fill")
                      Text("Add favourite")
                    }
                  }
                  
                  Button {
                    delete(course: course)
                  } label: {
                    HStack {
                      Image(systemName: "trash.fill")
                      Text("Delete")
                    }
                  }
                }
                .onTapGesture {
                  selectedCourse = course
                }
            }
          }
        }
        .listRowSeparatorTint(.blue)
      }
      .listStyle(.insetGrouped)
      .navigationTitle("All Courses")
      .navigationBarTitleDisplayMode(.automatic)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {
            showSettings = true
          }, label: {
            Image(systemName: "gear.circle")
              .font(.title2)
          })
        }
      }
      .sheet(isPresented: $showSettings) {
        SettingsView().environmentObject(settings)
      }
    }
    .tint(.blue)
    
  }
  
  private func purchase(course: Course) {
    if let index = courses.firstIndex(where: {$0.id == course.id}) {
      courses[index].isPurchased = true
    }
  }
  
  private func favourite(course: Course) {
    if let index = courses.firstIndex(where: {$0.id == course.id}) {
      courses[index].isFavourite.toggle()
    }
  }
  
  private func delete(course: Course) {
    if let index = courses.firstIndex(where: {$0.id == course.id}) {
      courses.remove(at: index)
    }
  }
  
  private func shouldShow(course: Course) -> Bool {
    let purchasedCondition = !settings.showPurchasedOnly || (settings.showPurchasedOnly && course.isPurchased)
    
    let favouriteCondition = !settings.showFavouriteOnly || (settings.showFavouriteOnly && course.isFavourite)
    
    let priceCondition = course.price <= settings.maxPriceShow
    
    let difficultyCondition = course.difficulty <= settings.maxDifficultyLevel
    
    return purchasedCondition && favouriteCondition && difficultyCondition && priceCondition
  }
  
}


#Preview {
  ContentView().environmentObject(SettingsFactory())
}

struct InfoImageRow: View {
  var course: Course
  
  var body: some View {
    HStack {
      Image(course.image)
        .resizable()
        .scaledToFill()
        .frame(width: 80, height: 50)
        .cornerRadius(14)
        .padding(.trailing, 16)
      
      VStack(alignment: .leading) {
        HStack {
          Text(course.name)
            .font(.system(.body, design: .rounded, weight: .bold))
          
          Image(systemName: "cellularbars", variableValue: Double(course.difficulty) / 4)
            .font(.subheadline)
            .foregroundStyle(CourseDifficulty.color(forDifficulty: course.difficulty))
        }
        Text("Created by: \(course.createdBy)")
          .font(.subheadline)
          .foregroundStyle(.secondary)
        
        Text("\(String(format: "%.2f €", course.price))")
          .font(.system(.subheadline, design: .rounded, weight: .bold))
          .foregroundStyle(.secondary)
        
      }
      
      Spacer()
      
      VStack {
        if course.isPurchased {
          Image(systemName: "checkmark.square.fill")
            .foregroundStyle(.blue)
            .padding(.bottom)
        }
        
        if course.isFavourite {
          Image(systemName: "star.square.fill")
            .foregroundStyle(.yellow)
        }
      }
      
    }
  }
}
