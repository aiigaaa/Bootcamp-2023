//
//  InfoViewController.swift
//  TempConverter
//
//  Created by aiga.bernane on 27/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var info: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info, let desc = desc{
            infoLabel.text = info
            descriptionLabel.text = desc
        }
        
    }
    

  
}
