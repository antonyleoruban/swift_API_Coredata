//
//  ListViewController.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofStudent.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nextVc: FeedsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedsViewController") as? FeedsViewController
        {
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell:StudentCell = (tableView.dequeueReusableCell(withIdentifier: "StudentCell") as? StudentCell)!
        let student = listofStudent[indexPath.row] as? NSManagedObject
        cell.lbl_Name.text = student?.value(forKey: "name") as? String
        return cell

    }
    
    var listofStudent : [Any] = []
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listofStudent = CoreDataModel.instanceShared.Fetch()
        print(listofStudent.count)
        print(listofStudent)


    }
    
    
}
