//
//  PortfolioTableViewCell.swift
//  CryptoWallet
//
//  Created by aiga.bernane on 01/12/2023.
//
import UIKit
import Foundation

class PortfolioTableViewCell: UITableViewCell {
    let coinNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    let holdingLabel: UILabel = {
            let label = UILabel()
           label.textAlignment = .right
           return label
        }()
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        contentView.backgroundColor = .black
            contentView.addSubview(coinNameLabel)
            contentView.addSubview(amountLabel)
            
           
            coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
            amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coinNameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
                amountLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            
      
        
        
        NSLayoutConstraint.activate([
            coinNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coinNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        coinNameLabel.textColor = .green
                amountLabel.textColor = .green
                holdingLabel.textColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(with coinLabel: String, amount: Double, currentPrice: Double) {
            let holdingValue = amount * currentPrice
            coinNameLabel.text = coinLabel
            holdingLabel.text = "\(holdingValue)"
        }
    }

