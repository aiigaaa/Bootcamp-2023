//
//  ViewController.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 29/11/2023.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController, UISearchResultsUpdating {
    
     let cellID = "cell"
     let coinAllUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en"
    let allCoinsUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"
    var allCoins: [CoinModel] = []
     var coins: [CoinModel] = []
     var filteredCoins: [CoinModel] = []
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchController()
        fetchData()
        
        
        NetworkManager.fetchData(url: allCoinsUrl) { coins in
                self.allCoins = coins
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.fetchCurrentPrices()
                }
            }
    }
    
    func fetchCurrentPrices() {
        for (index, coin) in coins.enumerated() {
            NetworkManager.fetchCoinDetails(coinID: coin.id!) { coinDetail in
                if let coinDetail = coinDetail {
                    self.coins[index].currentPrice = coinDetail.currentPrice
                }
                
                if index == self.coins.count - 1 {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    private func setupView(){
        view.backgroundColor = .black
        view.tintColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.delegate = self
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Coins"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
    }
    
    
    private func setupNavigationBar(){
        self.title = "My Wallet"
        
        _ = UIImage(systemName: "Arial Black")
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.tintColor = .systemGreen
        
        let titleLabel = UILabel()
            titleLabel.text = "Add coin"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.systemFont(ofSize: 20)
            titleLabel.sizeToFit()
        
        self.navigationItem.titleView = titleLabel
        
    }
    
    func fetchData() {
        NetworkManager.fetchData(url: coinAllUrl) { coins in
            self.coins = coins
            self.filteredCoins = coins
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCoins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        
        let coin = filteredCoins[indexPath.row]
        cell.textLabel?.text = coin.name
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        
        
        if let logoURLString = coin.image, let logoURL = URL(string: logoURLString) {
           
        cell.imageView?.sd_setImage(with: logoURL, placeholderImage: UIImage(named: "placeholder"))
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addCoin = AddCoin()
        addCoin.selectedCoin = filteredCoins[indexPath.row]
        navigationController?.pushViewController(addCoin, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased() {
            filteredCoins = searchText.isEmpty ? coins : allCoins.filter { coin in
                if let name = coin.name {
                    return name.lowercased().contains(searchText)
                }
                return false
            }
            tableView.reloadData()
        }
    
    }
    }
    

