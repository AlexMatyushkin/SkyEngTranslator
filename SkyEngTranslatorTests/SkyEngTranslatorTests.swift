//
//  SkyEngTranslatorTests.swift
//  SkyEngTranslatorTests
//
//  Created by 17503583 on 07.06.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import XCTest
@testable import SkyEngTranslator

class SkyEngTranslatorTests: XCTestCase {

    func testSearchWord() {
        
        //Given
        let apiService = APIService()
        let expectation = self.expectation(description: "Loading")
        var testResult = false
        //When
        apiService.searchWordTranslate(word: "home", completionHandler: { result in
            switch result {
            case .success(_):
                testResult = true
                expectation.fulfill()
            case .failure(_):
               break
            }
        })
        //Than
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(testResult)
    }
    
    func testGetFullInfohWord() {
        
        //Given
        let apiService = APIService()
        let expectation = self.expectation(description: "Loading")
        var testResult = false
        //When
        apiService.loadWordDetailedInfo(id: 313, completionHandler: { result in
            switch result {
            case .success(_):
                testResult = true
                expectation.fulfill()
            case .failure(_):
               break
            }
        })
        //Than
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(testResult)
    }
}
