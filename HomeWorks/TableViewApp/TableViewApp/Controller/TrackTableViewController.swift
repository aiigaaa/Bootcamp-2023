//
//  TrackTableViewController.swift
//  TableViewApp
//
//  Created by aiga.bernane on 29/10/2023.
//

import UIKit

class TrackTableViewController: UITableViewController {
    
    var songs = Song.createSong()
    
    /* var cover = [

    "Carly Rae Japsen - Dedicated",
      "Dj Khaled - father of",
        "Injury Reserve - Jailbrake",
        "Jonas Brothers - Happiness Begins ",
        "Joyner Lucas - adhd",
        "Maluma - 11-11",
        "Never Young - LOSER",
        "Rammstein - rammstein",
        "Skepta - Ignorance Is Bliss",
        "Skillet - Victory",
        "Tylor the Creator - IGOR",
        "YG - Stop Snitching",
    ]
    */
    override func loadView() {
        super.loadView()
        print("func: \(#function), line: \(#line)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("func: \(#function), line: \(#line)")
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("func: \(#function), line: \(#line)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("func: \(#function), line: \(#line)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("func: \(#function), line: \(#line)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("func: \(#function), line: \(#line)")
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.track
        cell.detailTextLabel?.text = song.album
        cell.imageView?.image = UIImage(named: song.cover)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            print("indexPath", indexPath)
            
            guard let detailVC = segue.destination as? DetailViewController else {return}
            detailVC.song = songs[indexPath.row]
        }
        
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.endUpdates()
        }
    }
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentIndex = songs.remove(at: fromIndexPath.row)
        songs.insert(currentIndex, at: to.row)

    }


    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

   

}
