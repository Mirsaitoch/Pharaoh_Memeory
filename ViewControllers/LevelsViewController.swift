//
//  LevelsViewController.swift
//  Pharaoh
//
//  Created by Мирсаит Сабирзянов on 2/28/23.
//

import Foundation

import UIKit

class LevelsViewController: UIViewController{
    
    
    override func viewWillAppear(_ animated: Bool) {
        back.setTitle("", for: .normal)
    }
    
    let preferences = UserDefaults.standard
    
    
    @IBOutlet var back: UIButton!
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "level_0" {
            preferences.set("0", forKey: "level")
            guard segue.identifier == "level_0" else { return }
            guard let destination = segue.destination as? GameViewController else { return }
            destination.level = "0"        }
        if segue.identifier == "level_1" {
            preferences.set("1", forKey: "level")
            guard segue.identifier == "level_1" else { return }
            guard let destination = segue.destination as? GameViewController else { return }
            destination.level = "1"        }
        if segue.identifier == "level_2" {
            preferences.set("2", forKey: "level")
            guard segue.identifier == "level_2" else { return }
            guard let destination = segue.destination as? GameViewController else { return }
            destination.level = "2"         }
        if segue.identifier == "level_3" {
            preferences.set("3", forKey: "level")
            guard segue.identifier == "level_3" else { return }
            guard let destination = segue.destination as? GameViewController else { return }
            destination.level = "3"
        }
    }
}
