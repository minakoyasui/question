//
//  BlueTableViewCell.swift
//  practice20210704
//
//  Created by MINAKO YASUI on 2021/07/18.
//

import UIKit

class BlueTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    
    @IBOutlet weak var imagebig: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
