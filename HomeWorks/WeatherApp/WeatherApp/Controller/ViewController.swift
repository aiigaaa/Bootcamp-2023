//
//  ViewController.swift
//  WeatherApp
//
//  Created by aiga.bernane on 10/11/2023.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var cityInputTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    let apiKey:String = "aebf8ef9e1msh5569ec359614b2cp180ce8jsnee7c56c05537"
    let apiHost:String = "weatherapi-com.p.rapidapi.com"
    let apiUrl:String = "https://weatherapi-com.p.rapidapi.com/current.json"
    var location: String = "Riga"
    
    var currentWeather:CurrentWeather?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
   
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        if let location = locations.last {
            if location.horizontalAccuracy > 0 {
                locationManager.stopUpdatingLocation()
                self.location = "\(location.coordinate.latitude), \(location.coordinate.longitude)"
                self.loadWeatherData()
            }
            
        }
    }
    
   @IBAction func findTemperature(_ sender: Any) {
       if let userEnteredLocation = self.cityInputTextField.text, !userEnteredLocation.isEmpty {
           self.location = userEnteredLocation
       }
       self.cityLabel.text = self.location
       loadWeatherData()
    }
    
    func loadWeatherData(){
        let headers:[String:String] = ["X-RapidAPI-Key": apiKey,
                                       "X-RapidAPI-Host": apiHost]
        
        let params:[String:String] = ["q":self.location]
        
    
        
        AF.request(apiUrl,method: .get,parameters: params, headers: HTTPHeaders(headers)).responseDecodable(of:CurrentWeather.self){
            response in
            switch response.result {
            case .success(let value):
                
                    self.currentWeather = value
                
                if let temperature = self.currentWeather?.current.tempC {
                    self.temperatureLabel.text = "\(temperature) ºC"
                } else {
                    self.temperatureLabel.text = "N/A"
                }
                self.cityLabel.text = self.currentWeather?.location.name ?? self.location
            case .failure(let error):
                print("Error fetching weather data: \(error)")
            }
        }
    }
}
