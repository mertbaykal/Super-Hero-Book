//
//  DetailsViewController.swift
//  super hero book
//
//  Created by Mert Baykal on 13/09/2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var selectedHeroName = " "
    var selectedHeroImage = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: selectedHeroImage)
       
    }
    

    

}
