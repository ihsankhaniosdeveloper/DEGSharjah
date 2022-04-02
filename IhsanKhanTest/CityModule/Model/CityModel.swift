//
//  CityModel.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 31/03/2022.
//

import Foundation

struct City: Decodable {
    let country : String?
    let name : String?
    let _id : Int?
    let coord : Coord?
}

struct Coord: Decodable {
    let lon : Double?
    let lat : Double?
}
