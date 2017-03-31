//
//  TextCell.swift
//  OCR_App
//
//  Created by Administrator on 21/09/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class TextCell: UITableViewCell {

    @IBOutlet weak var DisplayText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
