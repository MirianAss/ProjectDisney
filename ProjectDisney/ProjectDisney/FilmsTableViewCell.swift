//
//  FilmsTableViewCell.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 03/04/23.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFilmsCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(filmsCell: Datum?) {
        lblFilmsCell.text = filmsCell?.films?.description
    }
}
