//
//  RulesViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 3/2/23.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        back.setTitle("", for: .normal)
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
}
