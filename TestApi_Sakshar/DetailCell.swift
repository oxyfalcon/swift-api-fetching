//
//  DetailCell.swift
//  TestApi_Sakshar
//
//  Created by Akash Singh on 02/03/24.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var LblId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
