//
//  ViewController.swift
//  super hero book
//
//  Created by Mert Baykal on 10/09/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var superHerosNames = [String]() // self oldugundan emin olma 
    var superHeroImages = [String]() // self oldugunu emin olma
    var selectedName = " "
    var selectedImage = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
         
        superHerosNames.append("Batmen")
        superHerosNames.append("iron Man")
        superHerosNames.append("Spiderman")
        superHerosNames.append("Hulk")
        superHerosNames.append("Superman")
        
        //var superHeroImages = [UIImage]()
        //superHeroImages.append(UIImage(named: "batman")!)
        
        
        superHeroImages.append("batman")
        superHeroImages.append("ironman")
        superHeroImages.append("spiderman")
        superHeroImages.append("hulk")
        superHeroImages.append("superman")
    }

    // nuberOfRowInSecyion = kactane row olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHerosNames.count
    }
    // cellForFor atIndexPath = hucrenin icerisinde neler gozukecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHerosNames[indexPath.row]  // dizinin icindeki verilerin hepsini yazdirma
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete {
            superHerosNames.remove(at: indexPath.row)
            superHeroImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectedName = superHerosNames[indexPath.row]
         selectedImage = superHeroImages[indexPath.row]
        performSegue(withIdentifier: "toDiteailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDiteailsVC"{
            let destinaitonVC = segue.destination as! DetailsViewController
            destinaitonVC.selectedHeroName = selectedName
            destinaitonVC.selectedHeroImage = selectedImage
            
        }
    }
}

