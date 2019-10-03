//
//  ViewController.swift
//  MagicApp
//
//  Created by matheus.filipe.bispo on 03/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var array = [
        "Card 1",
        "Card 2",
        "Card 3",
        "Card 4",
        "Card 5",
        "Card 6",
        "Card 7",
        "Card 8",
        "Card 9",
        "Card 10",
        "Card 11",
        "Card 12",
        "Card 13",
        "Card 14",
        "Card 15",
        "Card 16",
        "Card 17",
        "Card 18",
        "Card 19",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "TBRECOMMENDEDCARDS"
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = array[indexPath.row]
        cell.accessibilityIdentifier = "Card\(indexPath.row+1)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailStoryboard") as! DetailViewController
        vc.cardId = indexPath.row+1
        self.present(vc, animated: true, completion: nil)
    }
}

