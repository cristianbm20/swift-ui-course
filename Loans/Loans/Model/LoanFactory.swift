//
//  LoanFactory.swift
//  Loans
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import Foundation

class LoanFactory: Decodable, ObservableObject {
  @Published var loans: [Loan] = []
  
  enum CodingKeys: CodingKey {
    case loans
  }
  
  // MARK: - Constructors
  
  required init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.loans = try container.decode([Loan].self, forKey: .loans)
  }
  
  init() {
    self.loans = []
  }
  
  // MARK: - Api download
  private static var apiURL = "https://api.kiva.org/v1/loans/newest.json"
  
  func fetchFromApi() {
    guard let url = URL(string: LoanFactory.apiURL) else {
      return
    }
    
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      // If there is an error in the API download
      if let error = error {
        print(error)
        return
      }
      
      // If the JSON arrives correctly
      if let data = data {
        DispatchQueue.main.async {
          self.loans = self.parseJson(data: data)
        }
      }
    }
    
    task.resume()
  }
  
  func parseJson(data: Data) -> [Loan] {
    let decoder = JSONDecoder()
    var loans: [Loan] = []
    
    do {
      let loanFactory = try decoder.decode(LoanFactory.self, from: data)
      loans = loanFactory.loans
    } catch {
      print(error)
    }
    
    return loans
  }
  
  
}
