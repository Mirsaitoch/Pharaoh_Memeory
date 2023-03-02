//
//  ViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pointns_label: UILabel!
    
    @IBAction func start_btn(_ sender: Any) {
    }
    @IBAction func rules_btn(_ sender: Any) {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let preferences = UserDefaults.standard
        let points = preferences.integer(forKey: "points")
        pointns_label.text = "Points: \(points)"
    }
    



}

