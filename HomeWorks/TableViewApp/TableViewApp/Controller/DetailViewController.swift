//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    var song: Song?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        if let mainSong = song {
            trackImageView.image = UIImage(named: mainSong.cover)
            trackNameLabel.text = mainSong.track + "\n\( mainSong.album)"
        }
    }
    
    deinit {
        print("func: \(#function), line: \(#line)")
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
