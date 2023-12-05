//
//  Portfolio.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 30/11/2023.
//

import UIKit
import CoreData

class Portfolio: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var currentPrices: [String: Double] = [:]
    
    private func setupNavigationBar(){
        self.title = "My Wallet"
        
        self.navigationController?.navigationBar.barTintColor = .black
        
        _ = UIImage(systemName: "Arial Black")
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.label]
        self.navigationController?.navigationBar.tintColor = .systemGreen
        
        
        let titleLabel = UILabel()
        titleLabel.text = "My Portfolio"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.sizeToFit()
        
        self.navigationItem.titleView = titleLabel
        
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped))
        
        addButton.tintColor = .systemGreen
        
        self.navigationItem.rightBarButtonItem = addButton
        
        let trashButton = UIBarButtonItem(
            image: UIImage(systemName: "trash"),
            style: .plain,
            target: self,
            action: #selector(trashButtonTapped))
        
        trashButton.tintColor = .systemGreen
        navigationItem.leftBarButtonItem = trashButton
    }
    
    
    
    @objc private func trashButtonTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
            updateDeleteButtonState()
    }

    @objc private func deleteButtonTapped() {
        deleteSelectedRows()
    }
    
    @objc private func addButtonTapped() {
        let addCoinViewController = ViewController()
        self.navigationController?.pushViewController(addCoinViewController, animated: true)
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var holdings: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        
        view.backgroundColor = .black
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        tableView.dataSource = self
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.backgroundColor = .black
        fetchCoinData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoinData()
    }
    
    func fetchCoinData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Holding")
        
        do {
            holdings = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holdings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CustomCell"
        var cell: PortfolioTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PortfolioTableViewCell
        
        if cell == nil{
            cell = PortfolioTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        let coin = holdings[indexPath.row]
        if let amount = coin.value(forKey: "amount") as? Double,
           let coinLabel = coin.value(forKey: "coinName") as? String{
            
            cell.coinNameLabel.text = coinLabel
            cell.amountLabel.text = "\(amount)"
        }
        
        let checkmark = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                checkmark.layer.cornerRadius = 5
                checkmark.layer.borderWidth = 1
                checkmark.layer.borderColor = UIColor.white.cgColor
                checkmark.backgroundColor = .black
                cell.multipleSelectionBackgroundView = checkmark
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if tableView.isEditing {
            updateDeleteButtonState()
        }
    }
    
    private func deleteSelectedRows() {
        guard let selectedRows = tableView.indexPathsForSelectedRows else {
            return
        }

        let sortedRows = selectedRows.sorted { $0.row > $1.row }

        for indexPath in sortedRows {
            let deletedHolding = holdings.remove(at: indexPath.row)
            deleteHoldingFromCoreData(deletedHolding)
        }

        tableView.reloadData()
        updateDeleteButtonState()
        tableView.setEditing(false, animated: true)
    }

    private func updateDeleteButtonState() {
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: "Delete",
                style: .plain,
                target: self,
                action: #selector(deleteButtonTapped)
            )
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "trash"),
                style: .plain,
                target: self,
                action: #selector(trashButtonTapped)
            )
        }
    }


    
    private func deleteHoldingFromCoreData(_ holding: NSManagedObject) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext
        context.delete(holding)

        do {
            try context.save()
        } catch let error as NSError {
            print("Error deleting holding: \(error), \(error.userInfo)")
        }
    
        }
    }
