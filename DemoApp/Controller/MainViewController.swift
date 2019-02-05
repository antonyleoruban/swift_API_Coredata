//
//  MainViewController.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getMethod()
    }
    
    @IBAction func Save_Button_Action(_ sender: Any) {
        
        CoreDataModel.instanceShared.Save()
    }
    @IBAction func Nex_Button_Action(_ sender: Any) {
        
        if let nextVc: ListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List") as? ListViewController
        {
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
    func getMethod()  {
        
        let scriptUrl = "http://172.16.0.246/g2socialmedia/api/posts?method=get&postId=4&header=DATE&body=DATA&userId="
        
        let urlWithParams = scriptUrl + "1000"
        guard let url = URL(string: urlWithParams) else {return}
        let session = URLSession.shared
        let urlRequest = URLRequest(url: url)
        
        let task : URLSessionDataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let response = response {
                
                print(response)
                
            }
            
            if let data = data {
                
                print(data)
                
                do {
                    
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                    
                    print(json)
                    
                    guard let results = json["data"] as? [[String: Any]] else{return} // Array Value
                    
                    print(results)
                    
                    for dicValue in results
                        
                    {
                        
                        print(dicValue)
                        
                    }
                    
                }catch {
                    
                    print(error)
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
    func ApiCall()
    {
        guard let url = URL(string: "http://172.16.0.246/g2socialmedia/api/posts?method=put&userId=1&postId=4&header=DATE&body=DATA") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response {
                print(response) // if status code = 200 - 299 -> success else check URL.
            }
            
            if let data = data {
                print(data)// raw data without serializing
                
                //serializing data to json format
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                    print(json)
                    guard let data = json["data"] as? [String: Any],
                        let postID = data["PostId"] as? Int,
                        let userID = data["UserId"] as? Int else {return }
                    print(postID, userID)
                    
                }catch {
                    print(error)
                }
                
                
                
            }
            }.resume()
        
    }
    
    //if loggedIn
    
    //{
    
    //    if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: REQUEST_HUDDLE_IDENTIFIER) as? RequestHuddleVC {
    
    //
    
    //        TOKEN = UserDefaults.standard.string(forKey: "Token") ?? ""
    
    //        print(TOKEN)
    
    //
    
    //        let navigationController = UINavigationController(rootViewController: homeVC)
    
    //        self.window?.rootViewController = navigationController
    
    //
    
    //    }
    
    //    self.window?.makeKeyAndVisible()
    
    //}
    

    //guard let url = URL(string: "http://172.16.0.246/g2socialmedia/api/posts?method=put&userId=1&postId=4&header=DATE&body=DATA") else {return}
    
    //
    
    //let session = URLSession.shared
    
    //session.dataTask(with: url) { (data, response, error) in
    
    //
    
    //    if let response = response {
    
    //        print(response) // if status code = 200 - 299 -> success else check URL.
    
    //    }
    
    //
    
    //    if let data = data {
    
    //        print(data)// raw data without serializing
    
    //
    
    //        //serializing data to json format
    
    //        do {
    
    //            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
    
    //            print(json)
    
    //
    
    //
    
    //            guard let data = json["data"] as? [String: Any],
    
    //                let postID = data["PostId"] as? Int,
    
    //                let userID = data["UserId"] as? Int else {return }
    
    //            print(postID, userID)
    
    //
    
    //
    
    //
    
    //        }catch {
    
    //            print(error)
    
    //        }
    
    //
    
    //
    
    //
    
    //    }
    
    //    }.resume()
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
