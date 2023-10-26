//
//  AppearaneViewController.swift
//  CalendarFinderApp
//
//  Created by aiga.bernane on 24/10/2023.
//

import UIKit

class AppearaneViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeItemTapped(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    //Open Settings when tapping button
    @IBAction func openSettings(_ sender: Any) {if let url = URL.init(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
        }
    // Switching Text according to dark mode or light mode
    func setLabelText(){
        var labeltext = "Unable to Specify UI style"
        textLabel.text = labeltext
        
        if self.traitCollection.userInterfaceStyle == .dark{
            textLabel.text = "Dark Mode Is On"
            
        }
        else { textLabel.text = "Light Mode Is On"
            }
    }
    
    
}

extension AppearaneViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
