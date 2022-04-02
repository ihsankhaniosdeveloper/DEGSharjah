//
//  BaseVC.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 31/03/2022.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setNavigationBar(title: String) {
        self.navigationController?.navigationBar.isHidden = false
        self.title = title
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.backgroundColor = .white
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        } else {
            let navBar = self.navigationController?.navigationBar
            navBar?.barTintColor = .white
            navBar?.tintColor = .white
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navBar?.isTranslucent = false
        }
    }
    
}
