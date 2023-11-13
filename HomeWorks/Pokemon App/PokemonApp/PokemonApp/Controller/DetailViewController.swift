//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by aiga.bernane on 09/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemontype: UILabel!
    @IBOutlet weak var pokemonSet: UILabel!
    @IBOutlet weak var pokemonResistance: UILabel!
    @IBOutlet weak var pokemonAttacks: UILabel!
    
    
    var pokemonName: String?
    var pokemonImageURL: String?
    var pokemonType: String?
    var pokemonCardSet: String?
    var pokemonResistances: String?
    var pokemonAttack: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemonName
        pokemontype.text = "Type: \(pokemonType ?? "") "
        pokemonSet.text = "Card Set: \(pokemonCardSet ?? "")"
        pokemonResistance.text = "Resistance:\n\(pokemonResistances ?? "")"
        pokemonAttacks.text = "\(pokemonAttack ?? "")"
        
        
        if let imageURL = URL(string: pokemonImageURL ?? "") {
            URLSession.shared.dataTask(with: imageURL) { data, _, error in
                if let data = data,
                   let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.pokemonImageView?.image = image
                        self.pokemonImageView?.setNeedsLayout()
                        
                    }
                }
            }.resume()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
