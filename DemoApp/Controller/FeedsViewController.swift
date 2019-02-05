//
//  FeedsViewController.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell", for: indexPath) as? FeedsCell else {return UITableViewCell()}
        
        let feed = feedsArr[indexPath.row]
        cell.configureCell(feed: feed)
        return cell
        
    }
    

    
    var feedsArr = [Feed]()
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        apiCallService()
        // Do any additional setup after loading the view.
    }
    
    func apiCallService()  {
        
        DispatchQueue.global().async {
            do
            {
                let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                //decoder.dateDecodingStrategy = .iso8601
                let downloadJson = try decoder.decode([Feed].self, from: data)
                DispatchQueue.main.async {
                    
                    self.feedsArr = downloadJson
                    self.tblView .reloadData()
                }
            }
            catch
            {
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
