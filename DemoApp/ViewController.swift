//
//  ViewController.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var toDictionaryArray :[[String : Any]] = []
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDictionaryArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nextVc: MainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MAINSCREEN) as? MainViewController
        {
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TbCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TbCell
        let dicValue = toDictionaryArray[indexPath.row] as Dictionary
        cell.lbl_Name.text = dicValue["name"] as? String
        cell.selectionStyle = .default
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginObj = StudentModel()
        loginObj.address = "helllo App"
        print(loginObj.address)
        
        for _ in 1...5 {
            let dict = ["name":"Antony","Age":"28"]
            toDictionaryArray.append(dict)
        }
    }
}

