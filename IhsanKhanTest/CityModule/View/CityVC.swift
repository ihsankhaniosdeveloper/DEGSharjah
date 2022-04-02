//
//  CityVC.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 31/03/2022.
//

import UIKit

class CityVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    let viewModle = CityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar(title: "Cities")
        viewModle.bindViewModel(view: self)
        viewModle.reloadData()
        viewModle.configureSearchController()
       
    }
    

}
