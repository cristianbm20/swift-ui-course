import UIKit

let json = """
{
"name": "Cristian Bermudez",
"country": "Spain",
"use": "To build a beautiful school for poor children",
"amount": 200
}
"""

struct Loan: Codable {
  var name: String
  var country: String
  var use: String
  var amount: Int
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
  do {
    let loan = try decoder.decode(Loan.self, from: jsonData)
    print(loan)
    print(loan.name)
  } catch {
    print(error)
  }
}
