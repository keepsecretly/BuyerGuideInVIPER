//
//  SCBBuyerGuideUITests.swift
//  SCBBuyerGuideUITests
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import XCTest

class SCBBuyerGuideUITests: XCTestCase {
    
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTapItem() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Moto E4 Plus"]/*[[".cells.staticTexts[\"Moto E4 Plus\"]",".staticTexts[\"Moto E4 Plus\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.swipeLeft()
        
        XCTAssertTrue(app.navigationBars["Moto E4 Plus"].otherElements["Moto E4 Plus"].exists)
        XCTAssertTrue(app.staticTexts["Rating: 4.9"].exists)
        XCTAssertTrue(app.staticTexts["Price: $179.99"].exists)
    }
    
    func testAddFavorite() {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Nokia 6")/*[[".cells.containing(.staticText, identifier:\"Rating: 4.6\")",".cells.containing(.staticText, identifier:\"Price: $199.99\")",".cells.containing(.staticText, identifier:\"Nokia is back in the mobile phone game and after a small price drop to the Nokia 6 we've now seen it enter our best cheap phone list. It comes with a Full HD 5.5-inch display, full metal design and a fingerprint scanner for added security. The battery isn't incredible on the Nokia 6, but it's not awful either making this one of our favorite affordable phones on the market right now.\")",".cells.containing(.staticText, identifier:\"Nokia 6\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["☆"].tap()
        
        let element = app.tables.staticTexts["Nokia 6"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        app/*@START_MENU_TOKEN@*/.buttons["Favourite"]/*[[".segmentedControls.buttons[\"Favourite\"]",".buttons[\"Favourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(element.exists)
        
        app.buttons["All"].tap()
        XCTAssertTrue(tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Nokia 6")/*[[".cells.containing(.staticText, identifier:\"Rating: 4.6\")",".cells.containing(.staticText, identifier:\"Price: $199.99\")",".cells.containing(.staticText, identifier:\"Nokia is back in the mobile phone game and after a small price drop to the Nokia 6 we've now seen it enter our best cheap phone list. It comes with a Full HD 5.5-inch display, full metal design and a fingerprint scanner for added security. The battery isn't incredible on the Nokia 6, but it's not awful either making this one of our favorite affordable phones on the market right now.\")",".cells.containing(.staticText, identifier:\"Nokia 6\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["★"].exists)
        app.tables.staticTexts["Nokia 6"].tap()
        
        XCTAssertTrue(app.navigationBars["Nokia 6"].otherElements["Nokia 6"].exists)

    }
    
    func testRemoveFavorite() {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Nokia 6")/*[[".cells.containing(.staticText, identifier:\"Rating: 4.6\")",".cells.containing(.staticText, identifier:\"Price: $199.99\")",".cells.containing(.staticText, identifier:\"Nokia is back in the mobile phone game and after a small price drop to the Nokia 6 we've now seen it enter our best cheap phone list. It comes with a Full HD 5.5-inch display, full metal design and a fingerprint scanner for added security. The battery isn't incredible on the Nokia 6, but it's not awful either making this one of our favorite affordable phones on the market right now.\")",".cells.containing(.staticText, identifier:\"Nokia 6\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["☆"].tap()
        
        let element = app.tables.staticTexts["Nokia 6"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        app/*@START_MENU_TOKEN@*/.buttons["Favourite"]/*[[".segmentedControls.buttons[\"Favourite\"]",".buttons[\"Favourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(element.exists)

        element.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        let notExists = NSPredicate(format: "exists == false")
        expectation(for: notExists, evaluatedWith: element, handler: nil)
        app/*@START_MENU_TOKEN@*/.buttons["Favourite"]/*[[".segmentedControls.buttons[\"Favourite\"]",".buttons[\"Favourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertFalse(element.exists)

    }
    
    func testSortSheet() {
        app.navigationBars["SCBBuyerGuide.MainView"].buttons["Sort"].tap()
        app.alerts["Sort"].buttons["Rating"].tap()
    }
}
