//
//  MoreCell.swift
//  TkweenProject
//
//  Created by Galexy on 11/04/2022.
//

import UIKit

class MoreCell: UITableViewCell {

  @IBOutlet weak var profileNameLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
