//
//  DetailViewController.swift
//  MagicApp
//
//  Created by matheus.filipe.bispo on 03/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    var cardId: Int = -1
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image?.accessibilityIdentifier = "IMGCARD\(cardId)"
    }

    @IBAction func onTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
