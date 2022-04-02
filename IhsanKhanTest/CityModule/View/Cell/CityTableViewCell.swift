//
//  CityTableViewCell.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 31/03/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityCountryCodeLbl: UILabel!
    @IBOutlet weak var cityCordsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var city: City? {
        didSet {
            
            self.cityCountryCodeLbl.text = (self.city?.name ?? "") + " " + (self.city?.country ?? "")
            self.cityCordsLbl.text = "lon: \(self.city?.coord?.lon ?? 00)" + " " + "lat: \(self.city?.coord?.lat ?? 0.0)"
         }
    }

}
