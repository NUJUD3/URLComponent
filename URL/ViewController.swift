//
//  ViewController.swift
//  URL
//
//  Created by Nojoud Mohaimmed on 09/04/1443 AH.
//

import UIKit
class PopulationData : Codable {
  var data : [Nation] = []
}
struct Nation : Codable {
    
  var IDNation : String
    var Nation : String
    var IDYear : Int
    var Year : String
    var Population : Int
    var SlugNation : String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getCarechater()
    }
    func getCarechater(){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "datausa.io"
        urlComponents.path = "/api/data?drilldowns=Nation&measures=Population"
        
        
        var urlRequest = URLRequest(url : urlComponents.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
           do {
             let jsonDecoder = JSONDecoder()
             let response = try jsonDecoder.decode(PopulationData.self, from: data!)
               print(response.data[0].Nation)
    } catch {
        print("err: \(error)")
      }
      }
     task.resume()

}

    }
