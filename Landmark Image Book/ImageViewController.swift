//
//  ImageViewController.swift
//  Landmark Image Book
//
//  Created by MAC-DIN-002 on 21/05/2019.
//  Copyright © 2019 MAC-DIN-002. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(selectedLandmarkName)"
        imageView.image = selectedLandmarkImage
        
        // Do any additional setup after loading the view.
    }
    

    

}
