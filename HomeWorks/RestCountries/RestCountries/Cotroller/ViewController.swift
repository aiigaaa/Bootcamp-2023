//
//  ViewController.swift
//  RestCountries
//
//  Created by aiga.bernane on 15/11/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellID = "cell"
    private let countryAllUrl = "https://restcountries.com/v3.1/all"
    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        NetworkManager.fetchData(url: countryAllUrl){
            countries in
            self.countries = countries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    private func setupView(){
        view.backgroundColor = .secondarySystemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()
        tableView.delegate = self
        tableView.delegate = self
    }
    
    
    private func setupNavigationBar(){
        
        self.title = "Countries"
        _ = UIImage(systemName: "mappin.and.ellipse")
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.tintColor = .label
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        
        let country = self.countries[indexPath.row]
        cell.textLabel?.text = country.name.common
        cell.detailTextLabel?.text = country.name.official
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        
        let alert = UIAlertController(title: "Country Details", message: countryDetailsMessage(selectedCountry), preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func countryDetailsMessage(_ country: Country) -> String {
        var details = ""
        details += "Country: \(country.name.common ?? "Country not found")\n"
        details += "Region: \(country.region ?? "Region not found")\n"
        details += "Subregion: \(country.subregion ?? "Subregion not found")\n"
        
        return details
        
        }
        
    }
    

