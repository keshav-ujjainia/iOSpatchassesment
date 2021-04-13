//
//  TableViewCell.swift
//  patchinfotechassessmentbykeshav
//
//  Created by keshav ujjainia on 12/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var stockImg: UIImageView!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shareView.layer.cornerRadius = 5
        shareButton.layer.cornerRadius = 5
    }

  

}
