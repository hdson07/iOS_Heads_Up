//
//  Start_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit


class Start_ViewController: UIViewController, GameDelegateProtocol {
    var gameSetting : GameSetting?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func CreatNewRound() {
        self.dismiss(animated: false, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Game_ViewController {
            vc.gameSetting = self.gameSetting!
            vc.delegate = self
        }
    }
}
