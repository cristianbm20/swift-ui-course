//
//  PaymentFormView.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import SwiftUI

struct PaymentFormView: View {
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  PaymentFormView()
}

struct FormTextField: View {
  let name: String
  let placeholder: String
  @Binding var value: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(name.uppercased())
        .font(.system(.headline, design: .rounded, weight: .semibold))
        .foregroundStyle(.primary)
        .padding(.horizontal)
      
      TextField(placeholder, text: $value)
        .font(.system(.headline, design: .rounded))
        .foregroundStyle(.primary)
        .padding()
        .border(Color("Border"), width: 0.5)
    }
  }
}

#Preview("Text Field") {
  FormTextField(name: "test", placeholder: "Enter your value...", value: .constant(""))
}

struct FormDateField: View {
  let name: String
  @Binding var value: Date
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(name.uppercased())
        .font(.system(.headline, design: .rounded, weight: .semibold))
        .foregroundStyle(.primary)
        .padding()
      
      DatePicker("", selection: $value, displayedComponents: .date)
        .tint(.primary)
        .padding()
        .border(Color("Border"), width: 0.5)
        .labelsHidden()
    }
  }
}

#Preview("Form Date Field") {
  FormDateField(name: "Date", value: .constant(Date()))
}

struct FormTextEditor: View {
  let name: String
  let height: CGFloat = 50
  @Binding var value: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(name.uppercased())
        .font(.system(.headline, design: .rounded, weight: .semibold))
        .foregroundStyle(.primary)
        .padding(.horizontal)
      
      TextEditor(text: $value)
        .frame(minHeight: height)
        .font(.system(.headline, design: .rounded))
        .foregroundStyle(.primary)
        .padding()
        .border(Color("Border"), width: 0.5)
    }
  }
}

#Preview("Long Text Editor") {
  FormTextEditor(name: "Text", value: .constant(""))
}

struct ValidationErrorText: View {
  var iconName  = "info.circle"
  var iconColor = Color.red.opacity(0.75)
  var text = ""
  
  var body: some View {
    HStack {
      Image(systemName: iconName)
        .foregroundStyle(iconColor)
      
      Text(text)
        .font(.system(.body, design: .rounded))
        .foregroundStyle(.secondary)
      
      Spacer()
    }
  }
}

#Preview("Validation Error") {
  ValidationErrorText(text: "The amount cannot be negative")
}
