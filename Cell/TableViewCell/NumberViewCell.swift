//
//  NumberViewCell.swift
//  TkweenProject
//
//  Created by Galexy on 13/04/2022.
//

import UIKit

class NumberViewCell: UITableViewCell {

  @IBOutlet weak var iconLabel: UIImageView!
  @IBOutlet weak var textFieldPlaceholder: UITextField!
  @IBOutlet weak var textHeadingLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
