//
//  ViewController.swift
//  PokemonApp
//
//  Created by aiga.bernane on 06/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet var tableViewController: UITableView!
    
    var pokemon: Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.dataSource = self
        tableViewController.delegate = self
        
        
        loadPokemonData()
        
        // Do any additional setup after loading the view.
    }
    

    
    func loadPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        guard let url = URL(string: jsonUrl) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) {
            data, response, error in
            if error != nil{
                print((error?.localizedDescription)!)
            }
            dump(response)
            
            guard let data = data else {
                            print(String(describing: error))
                            return
                        }
                        
                        do{
                            let jsonData = try JSONDecoder().decode(Pokemon.self,from:data)
                            dump(jsonData)
                            self.pokemon = jsonData
                            
                            DispatchQueue.main.async { self.tableViewController.reloadData()}
                            
                        }catch{
                            print("error::::",error)
                        }
                    }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon?.cards.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let card = pokemon?.cards[indexPath.row], let imageURL = URL(string: card.imageURL){
            cell.textLabel?.text = card.name
            if let types = card.types {
                cell.detailTextLabel?.text = types.joined(separator: ", ")
            }
            
            URLSession.shared.dataTask(with: imageURL) {data, _, error in
                if let data = data, 
                let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async{
                    cell.imageView?.image = image
                    cell.setNeedsLayout()
                }
            }
            
        }.resume()
        }
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110}

}

