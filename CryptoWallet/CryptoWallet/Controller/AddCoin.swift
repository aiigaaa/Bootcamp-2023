//
//  AddCoin.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 29/11/2023.
//

import UIKit
import CoreData

class AddCoin: UIViewController, UITextFieldDelegate {
    
    var selectedCoin: CoinModel? {
            didSet {
                updateUI()
            }
        }
    
     let coinLabel: UILabel = {
               let label = UILabel()
               label.textColor = .systemGreen
               label.font = UIFont.boldSystemFont(ofSize: 50)
               label.translatesAutoresizingMaskIntoConstraints = false
               return label
           }()
    
    let coinImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.backgroundColor = .clear
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                return imageView
            }()
    
    let priceLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 30)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let amountTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter Amount"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()

    lazy var cancelButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Cancel", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
            return button
        }()
    
        lazy var saveButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Add", for: .normal)
            button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .black
            view.addSubview(coinImageView)
            view.addSubview(coinLabel)
            view.addSubview(amountTextField)
            view.addSubview(saveButton)
            view.addSubview(cancelButton)
            view.addSubview(priceLabel)
            updateUI()
            
            saveButton.backgroundColor = .green
                saveButton.setTitleColor(.white, for: .normal)
                saveButton.layer.cornerRadius = 8

                cancelButton.backgroundColor = .red
                cancelButton.setTitleColor(.white, for: .normal)
                cancelButton.layer.cornerRadius = 8
            
            amountTextField.backgroundColor = .gray
                amountTextField.tintColor = .white

            
           
    
    
            NSLayoutConstraint.activate([
                coinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    coinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                    priceLabel.topAnchor.constraint(equalTo: coinLabel.bottomAnchor, constant: 20),
                    priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                    amountTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
                    amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                saveButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
                        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                        saveButton.widthAnchor.constraint(equalToConstant: 100), 

                        cancelButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
                        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                        cancelButton.widthAnchor.constraint(equalToConstant: 100),                ])
        }

    @objc func saveButtonTapped() {
            guard let amountText = amountTextField.text, let amount = Double(amountText) else {
                return
            }
        saveCoinData(amount: amount, coinLabel: coinLabel.text ?? "")
        if let portfolioViewController = navigationController?.viewControllers.first(where: { $0 is Portfolio }) {
                navigationController?.popToViewController(portfolioViewController, animated: true)
            }
        }
    
    @objc func cancelButtonTapped() {
        if let portfolioViewController = navigationController?.viewControllers.first(where: { $0 is Portfolio }) {
            navigationController?.popToViewController(portfolioViewController, animated: true)}
        }
    func updateUI() {
        guard let selectedCoin = selectedCoin else {
                return
            }

            coinLabel.text = selectedCoin.name ?? ""
            
            if let imageName = selectedCoin.image {
                coinImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
            } else {
                print("Image name is nil for \(selectedCoin.name ?? "Unknown Coin")")
            }

            if let
                currentPrice = selectedCoin.currentPrice {
                priceLabel.text = "\(currentPrice) EUR"
            } else {
                priceLabel.text = "Current Price: N/A"
                print("Current Price is nil for \(selectedCoin.name ?? "Unknown Coin")")
            }
        }
            
    func saveCoinData(amount: Double, coinLabel: String) {
                    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                        return
                    }

                    let context = appDelegate.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "Holding", in: context)!
                    let holding = NSManagedObject(entity: entity, insertInto: context)

                    holding.setValue(amount, forKey: "amount")
        holding.setValue(coinLabel, forKey: "coinName")

                    do {
                        try context.save()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                }
        }
    
        
        
