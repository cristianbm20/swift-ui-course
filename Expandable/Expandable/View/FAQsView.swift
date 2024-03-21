//
//  FAQsView.swift
//  Expandable
//
//  Created by Cristian Bermudez Martinez on 21/3/24.
//

import SwiftUI

struct FAQsView: View {
  @State var showAll = Array(repeating: false, count: faqs.count)
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(faqs.indices, id: \.self) { index in
          DisclosureGroup(
            isExpanded: $showAll[index],
            content: {
              Text(faqs[index].answer)
                .font(.system(.body, design: .rounded, weight: .light))
                .padding(.bottom)
            },
            label: {
              Text("\(index + 1). \(faqs[index].title)")
                .font(.system(.headline, design: .rounded, weight: .bold))
            }
          )
        }
      }
      .padding()
      .listStyle(.plain)
      .navigationTitle("FAQs")
      .ignoresSafeArea(.all, edges: .bottom)
      .toolbar {
        if showAll.contains(true) {
          Button {
            showAll = showAll.map({ _ in
              false
            })
          } label: {
            Text("Hide all")
              .font(.system(.subheadline, design: .rounded, weight: .bold))
          }
        } else {
          Button {
            showAll = showAll.map({ _ in
              true
            })
          } label: {
            Text("Show all")
              .font(.system(.subheadline, design: .rounded, weight: .bold))
          }
        }
      }
    }
    
  }
}

#Preview {
  FAQsView()
}
