//
//  ViewController.swift
//  Landmark Image Book
//
//  Created by MAC-DIN-002 on 21/05/2019.
//  Copyright © 2019 MAC-DIN-002. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    /*création d'une arryList de String et d'une ArrayList d'UIImage*/
    var landmarkNamesArray = [String]()
    var landmarkImagesArray = [UIImage]()
    
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*ne pas oublier d'ajouter UITableViewDelegate, UITableViewDataSource a ViewController*/
        tableView.dataSource = self
        tableView.delegate = self
        
        /*on remplit les arrayList*/
        landmarkNamesArray.append("Colisée")
        landmarkNamesArray.append("Louvre")
        landmarkNamesArray.append("Kremlin")
        landmarkNamesArray.append("Stonehenge")
        landmarkNamesArray.append("Taj Mahal")
        
        landmarkImagesArray.append(UIImage(named: "colisée.jpg")!)
        landmarkImagesArray.append(UIImage(named: "louvre.jpg")!)
        landmarkImagesArray.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImagesArray.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImagesArray.append(UIImage(named: "TajMahal.jpg")!)
        
        
        
    }
    
    /*On spécifie un nombre de lignes à la tableView*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNamesArray.count
    }
    /*On remplit les cellules de la tableView*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        /*indexPath.row retourne l'index de la ligne de la tableView
         on place donc le texte de l'arrayList dans les cellules*/
        cell.textLabel?.text = landmarkNamesArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*si on glisse la cellule vers la gauche son style passe en delete*/
        if( editingStyle == .delete){
            
            /*on suprime la ligne des array et on le retire du tableau*/
            landmarkImagesArray.remove(at: indexPath.row)
            landmarkNamesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }
    /*cette fonction est lancée quand l'utilisateur choisit une cellule*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenLandmarkName = landmarkNamesArray[indexPath.row]
        self.chosenLandmarkImage = landmarkImagesArray[indexPath.row]
        performSegue(withIdentifier: "toImageVCSegue", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVCSegue"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
        }
    }
    
    
    
}

