//
//  HomeViewController.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 30/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btStart(_ sender: Any) {
        if let screen = self.storyboard?.instantiateViewController(withIdentifier: "navigation") {
            screen.modalPresentationStyle = .fullScreen
            screen.modalTransitionStyle = .flipHorizontal
            self.present(screen, animated: true)
        }
    }
}

