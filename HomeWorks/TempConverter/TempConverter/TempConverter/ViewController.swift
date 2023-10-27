//
//  ViewController.swift
//  TempConverter
//
//  Created by aiga.bernane on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControler: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider!{
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
        tempSlider.addTarget(self, action: #selector(converttemperature), for: .valueChanged)
        tempSegmentControler.addTarget(self, action: #selector(converttemperature), for: .valueChanged)
        tempSegmentControler.selectedSegmentIndex = 0
        
        
    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        celsiusLabel.text = String (format: "%.1f°C",tempSlider.value)
        
    }
    func updateTempFromSLider(value: Float){
        print("tenpSlider:", Int(value))
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let infoScreen = storyBoard.instantiateViewController(withIdentifier: "InfoViewController") as?
                InfoViewController else {return}
        infoScreen.info = "Converted temperature"
        infoScreen.desc = "\(convertedTempLabel.text ?? "")"
        self.navigationController?.pushViewController(infoScreen, animated: true)
        
    }
    
    
    @IBAction func converttemperature(_ sender: Any) {
        let selectedSegmentIndex = tempSegmentControler.selectedSegmentIndex
        let celsius = tempSlider.value
        
        if selectedSegmentIndex == 0 {
            let fahrenheit = (celsius * 9/5) + 32
            convertedTempLabel.text = String(format: "%.2f°F", fahrenheit)
        }
        else {
            let kelvin = celsius + 273.15
            convertedTempLabel.text = String(format: "%.2fK", kelvin)
        }
        }
    }

