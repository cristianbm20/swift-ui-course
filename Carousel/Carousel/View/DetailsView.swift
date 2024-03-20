//
//  DetailsView.swift
//  Carousel
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import SwiftUI

struct DetailsView: View {
  let title: String
  
  var body: some View {
    GeometryReader { geometry in
      
        ZStack {
          VStack(alignment: .leading, spacing: 12) {
            Text(title)
              .font(.system(.title,design: .rounded, weight: .semibold))
            
            HStack(spacing: 8) {
              ForEach(1...5, id: \.self) { _ in
                Image(systemName: "star.fill")
                  .foregroundStyle(.yellow)
                  .font(.system(size: 18))
              }
              
              Text("5.0")
                .font(.system(.callout, design: .rounded, weight: .semibold))
                .padding(.leading)
            }
            
            Text("Course description")
              .font(.system(.title3, design: .rounded, weight: .semibold))
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Est ante in nibh mauris cursus mattis molestie a iaculis. Cras semper auctor neque vitae tempus. Dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh.\n\nNunc id cursus metus aliquam eleifend. Vel facilisis volutpat est velit egestas dui id ornare arcu. Sapien faucibus et molestie ac feugiat sed. Facilisis magna etiam tempor orci eu lobortis elementum nibh tellus.\n\nNascetur ridiculus mus mauris vitae ultricies. Cursus euismod quis viverra nibh cras pulvinar mattis nunc sed. Pharetra et ultrices neque ornare aenean euismod elementum nisi. Velit ut tortor pretium viverra suspendisse potenti. Ullamcorper morbi tincidunt ornare massa eget. Orci ac auctor augue mauris augue neque gravida.\n\nPharetra et ultrices neque ornare aenean euismod elementum nisi. Velit ut tortor pretium viverra suspendisse potenti. Ullamcorper morbi tincidunt ornare massa eget. Orci ac auctor augue mauris augue neque gravida.")
              .padding(.bottom)
            
            Button {
              // TODO: Goes to course web
            } label: {
              Text("Enroll now")
                .font(.system(.headline, design: .rounded, weight: .heavy))
                .foregroundStyle(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
          }
          .padding()
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 14))
          
          Image(systemName: "bookmark.fill")
            .font(.system(size: 40))
            .foregroundStyle(.blue)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
            .offset(x: -15, y: -5)
        }
        .offset(y: 25)
        
      
    }
  }
}

#Preview {
  DetailsView(title: "Discrete mathematics course")
    .background(.gray)
}
