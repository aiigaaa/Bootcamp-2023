//
//  ViewController.swift
//  ABAutoLayout
//
//  Created by aiga.bernane on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var styleOutletsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleOutletsCollection.forEach { button in
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.black.cgColor}
        // Do any additional setup after loading the view.
    }


    @IBAction func setBackgroundGray(_ sender: Any) {
        view.backgroundColor = UIColor.gray
    }
    
    @IBAction func setBackgroundWhite(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    @IBOutlet var changeColor: [UIButton]!
    
    @IBAction func setButtonsRed(_ sender: UIButton) {
        changeColor.forEach { buttons in
            buttons.layer.backgroundColor = UIColor.red.cgColor}
    }
    
    @IBAction func setButtonsBlue(_ sender: UIButton) { changeColor.forEach { buttons in
        buttons.layer.backgroundColor = UIColor.systemBlue.cgColor}
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func changeImage(_ sender: UIButton) {
            imageView.image = UIImage(named: "apple2")
    }
}

