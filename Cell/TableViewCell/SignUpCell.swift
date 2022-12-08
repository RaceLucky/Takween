//
//  SignUpCell.swift
//  TkweenProject
//
//  Created by Galexy on 13/04/2022.
//

import UIKit

class SignUpCell: UITableViewCell {

  @IBOutlet weak var textFieldPlaceHolder: UITextField!
  @IBOutlet weak var detailImageView: UIImageView!
  @IBOutlet weak var detailtextLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
