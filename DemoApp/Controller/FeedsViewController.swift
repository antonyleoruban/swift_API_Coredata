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
        
        
        let fixedWidth = tableView.frame.size.width
       
//        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        
//        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)


        
        let feed = feedsArr[indexPath.row]
        cell.configureCell(feed: feed)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nextVc: LocationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
        {
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        
    }
    

    
    var feedsArr = [Feed]()
    @IBOutlet weak var animationView: UIActivityIndicatorView!
    
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
                    self.animationView.stopAnimating()

                }
            }
            catch
            {
                DispatchQueue.main.async {
                debugPrint(error.localizedDescription)
                    self.animationView.stopAnimating()

                }
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
