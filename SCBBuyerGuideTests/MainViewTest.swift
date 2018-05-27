//
//  MainViewTest.swift
//  SCBBuyerGuideTests
//
//  Created by NiM on 5/27/2561 BE.
//  Copyright © 2561 NiM. All rights reserved.
//

import XCTest

@testable import SCBBuyerGuide

class MainViewTest: XCTestCase {
    
    var mainView:MainViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        if let navigation = UIStoryboard(name: StoryBoardHelper.MAIN, bundle: Bundle(for: MainViewController.self)).instantiateInitialViewController() as? UINavigationController {
            self.mainView = navigation.viewControllers.first as? MainViewController
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func mockList() -> [Product] {
        var list = [Product]()
        
        for i in 1..<5 {
            var product = Product()
            product.itemID = 100+i
            product.price = Double(20 + arc4random()%100)
            product.rating = Float(1 + arc4random()%5)
            list.append(product)
        }
        
        return list
    }
    
    func testSortPrice() {
        let mockList = self.mockList()
        let sorted = SortProduct().sort(list: mockList, by: .lowToHigh)
        XCTAssertLessThanOrEqual(sorted.first?.price ?? 0, sorted.last?.price ?? 0)
    }
    
    func testSortMaxPrice() {
        let mockList = self.mockList()
        let sorted = SortProduct().sort(list: mockList, by: .highToLow)
        XCTAssertLessThanOrEqual(sorted.last?.price ?? 0, sorted.first?.price ?? 0)
    }
    
    func testSortRating() {
        let mockList = self.mockList()
        let sorted = SortProduct().sort(list: mockList, by: .rating)
        XCTAssertLessThanOrEqual(sorted.last?.rating ?? 0, sorted.first?.rating ?? 0)
    }

}
