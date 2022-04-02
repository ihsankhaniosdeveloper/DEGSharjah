//
//  IhsanKhanTestTests.swift
//  IhsanKhanTestTests
//
//  Created by TNC_10471 on 01/04/2022.
//

import XCTest
@testable import IhsanKhanTest

class IhsanKhanTestTests: XCTestCase {
    
    var sut: CityViewModel?
    var vc: CityVC?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CityViewModel()
        vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityVC") as? CityVC
     
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        vc = nil
    }
    
    func testCityViewModel_whenCorrectFileNameProvided_returnCities() {
       
        let cities = sut?.loadCities(filename: "cities")
        
        XCTAssertTrue(cities != nil, "cities is nil while it should be an array of city objects")
    }
    
    func testCityViewModel_whenIncorrectCorrectFileNameProvided_returnNil() {
       
        let cities = sut?.loadCities(filename: "citie")
        
        XCTAssertTrue(cities == nil, "cities should be nil when incorrect file name provided")
    }
    
    func testCityVC_whenNavigationIsNotEmbedded_shouldReturnTrue() {
        
        
        XCTAssertTrue(vc?.navigationController == nil, "City navigation controller should be nil when not embedded in navigation controller")
        
    }
    
    
    func testRootController_initializedFromStoryboard_isNotNil() {
        
        
        
        XCTAssertTrue(vc != nil, "Root Controller is nil")
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

  

}
