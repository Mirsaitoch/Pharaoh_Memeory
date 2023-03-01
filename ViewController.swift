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
    
    
//    func saveAccessToken(access_token: String, token_type: String, refresh_token: String, scope: String){
//            let preferences = UserDefaults.standard
//            print("saveAccessToken : \(access_token)")
//            preferences.set(access_token, forKey: "access_token")
//            preferences.set(token_type, forKey: "token_type")
//            preferences.set(refresh_token, forKey: "refresh_token")
//            preferences.set(scope, forKey: "scope")
//            // Checking the preference is saved or not
//            didSave(preferences: preferences)
//        }
//
//    func getAccessToken() -> String{
//            let preferences = UserDefaults.standard
//            if preferences.string(forKey: "access_token") != nil{
//                let access_token = preferences.string(forKey: "access_token")
//                return access_token!
//            } else {
//                return ""
//            }
//        }
//
//    func didSave(preferences: UserDefaults){
//        let didSave = preferences.synchronize()
//        if !didSave{
//            print("Preferences could not be saved!")
//            }
//        }


}

