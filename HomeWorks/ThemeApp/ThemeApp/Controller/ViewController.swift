//
//  ViewController.swift
//  ThemeApp
//
//  Created by aiga.bernane on 19/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trashButton: UIBarButtonItem!
    @IBOutlet weak var folderButton: UIBarButtonItem!
    @IBOutlet weak var DarkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("func viewDidLoad")
        DarkButton.layer.cornerRadius = 10
        
    }
    @IBAction func darkButtonTapped(_ sender: Any) {
        
        if view.backgroundColor == UIColor.black {
                view.backgroundColor = UIColor.white
                navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                
                DarkButton.setTitle("Dark theme on", for: .normal)
                DarkButton.setTitleColor(UIColor.white, for: .normal)
                DarkButton.tintColor = UIColor.black
        } else {
            view.backgroundColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            DarkButton.setTitle("Dark theme off", for: .normal)
            DarkButton.setTitleColor(UIColor.black, for: .normal)
            DarkButton.tintColor = UIColor.white
        }
    }
    
    @IBAction func folderTapped(_ sender: Any) {
        basicAlert(title: "My folder", message: "This is my item button!")
    }
    @IBAction func trashTapped(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Action Sheet", message: "This is my action sheet", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present (actionSheet, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async { 
            let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}
