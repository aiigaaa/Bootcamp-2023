//
//  MovieDetailViewController.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var largeMovieimageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var videoButton: UIButton!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let mainMovie = movie {
            yearLabel.text = "\(mainMovie.releaseYears)"
            largeMovieimageView.image = UIImage(named: mainMovie.imageNames)
            titleLabel.text = mainMovie.movieTitles
            descriptionLabel.text = mainMovie.descriptions
            
        }
        
    
    }
    
    @IBAction func trailerButtonTapped(_ sender: UIButton) {
       if let trailer = movie?.movieTrailerUrls,
          let url = URL(string: trailer) {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }
        else {
        
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
