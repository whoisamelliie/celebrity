//
//  CelebrityTableViewController.swift
//  celebrityAPI
//
//  Created by Amelie Baimukanova on 26.02.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class CelebrityTableViewController: UITableViewController {
    
    var arrayCelebrity: [Celebrity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadCelebrity(name: "michael jordan", nationality: "us")
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCelebrity.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        
        let nameLabel = cell.viewWithTag(100) as! UILabel
        nameLabel.text = arrayCelebrity[indexPath.row].name
        
        let nationalityLabel = cell.viewWithTag(200) as! UILabel
        nationalityLabel.text = arrayCelebrity[indexPath.row].nationality
        
        let genderLabel = cell.viewWithTag(300) as! UILabel
        genderLabel.text = arrayCelebrity[indexPath.row].gender
        
        return cell
    }
    
    func loadCelebrity(name: String, nationality: String) {
        SVProgressHUD.show()
        
        let parameters: [String : Any] = [
            name: "michael",
            nationality: "us"
        ]
        
        let headers: HTTPHeaders = ["X-Api-Key": "4Hfm34Y3q4FK4db2S0YHGw==edhMXqyRQLd7wX4h"]
        
        let name = "Alex".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        AF.request("https://api.api-ninjas.com/v1/celebrity?name="+name!, method: .get, headers: headers).response { response in
            
            SVProgressHUD.dismiss()
            // print(String(data: response.data!, encoding: .utf8))
            
            if response.response?.statusCode == 200 {
                
                let json = JSON(response.data!)
                
                if let celebrityJson = json.array {
                    
                    for celebrity in celebrityJson {
                        self.arrayCelebrity.append(Celebrity(json:celebrity ))
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
}

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 115
}

