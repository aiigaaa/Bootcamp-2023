//
//  MovieTableViewCell.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

   
    
    
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieYearLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieGenresLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
