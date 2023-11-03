//
//  ViewController.swift
//  CalendarFinderApp
//
//  Created by aiga.bernane on 24/10/2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // dismissing keyboard when clicking outside the box
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //calendar, datacomponents, dateformater --> dateFormat, Logic Calculation, it can't be 0, present alert if soething went wrong. Result is presenting the day of the week. Find to clear(clear all text fields empty
    
    func clearTextFields(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        guard let dayText = dayTextField.text, let monthText = monthTextField.text, let yearText = yearTextField.text,
              let day = Int(dayText), let month = Int(monthText), let year = Int(yearText) else{ resultLabel.text = "Invalid input"
            return
        }
        
        let calendar = Calendar.current
        if day < 1 || day > 31 || month < 1 || month > 12 || year < 1 {
            resultLabel.text = "Invalid date"
            clearTextFields()
            return
        }
        
        
        let dateComponents = DateComponents(year: year, month: month, day: day)
        
        
        if let date = calendar.date(from: dateComponents){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayOfWeek = dateFormatter.string(from: date)
            resultLabel.text = dayOfWeek
            clearTextFields()
        }else {
            resultLabel.text = "Invalid date"
        }
        
        
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "info" {
                
                // Get the new view controller using segue.destination.
                guard let vc = segue.destination as? infoViewController else { return }
                
                // Pass the selected object to the new view controller.
                
                
                if resultLabel.text == "Invalid date" {
                    vc.info = "Weekday not found"
                    vc.descr = "Please enter correct date"
                }
                else {
                    vc.info = "Your Weekday is:"
                    vc.descr = resultLabel.text
                }
            }
        }
        
    }
}
