//
//  FeedsCell.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit

class FeedsCell: UITableViewCell {

    @IBOutlet weak var lbl_ID: UILabel!
    @IBOutlet weak var lbl_Title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(feed: Feed) {
        
        lbl_ID.text = "\(feed.id)"
        lbl_Title.text = feed.title
       // print(feed.address)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
