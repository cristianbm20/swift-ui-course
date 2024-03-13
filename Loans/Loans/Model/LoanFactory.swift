//
//  LoanFactory.swift
//  Loans
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import Foundation

class LoanFactory: Decodable, ObservableObject {
  private var downloadedLoans: [Loan] = []
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
  
  // MARK: - Api Download
  private static var apiURL = "https://api.kivaws.org/v1/loans/newest.json"
  
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
          let fetchedLoans = self.parseJson(data: data)
          self.downloadedLoans = fetchedLoans
          self.loans = fetchedLoans
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
  
  // MARK: - Filter Loans
  func filterLoans(maxAmount: Int) {
    self.loans = self.downloadedLoans.filter { $0.amount < maxAmount }
  }
  
}
