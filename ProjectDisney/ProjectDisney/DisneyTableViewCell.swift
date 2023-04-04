//
//  DisneyTableViewCell.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 30/03/23.
//

import UIKit
import SDWebImage

class DisneyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageDisney: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupDisney(datum: Datum?) {
        lblName.text = datum?.name ?? ""
        let urlImage = URL(string: datum?.imageURL ?? "")
        imageDisney.sd_setImage(with: urlImage)
    }
}
