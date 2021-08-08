//
//  SwiftUIMVVMTests.swift
//  SwiftUIMVVMTests
//
//  Created by Vinay Nation on 08/08/21.
//

import XCTest
@testable import SwiftUIMVVM

class MockDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion([User(id: 1, name: "Vinay")])
    }
}

class SwiftUIMVVMTests: XCTestCase {

    var sot: UsersView.ViewModel!
       
       override func setUpWithError() throws {
           sot = UsersView.ViewModel(dataService: MockDataService())
       }

       override func tearDownWithError() throws {
           sot = nil
       }
       
       func test_getUsers() throws {
           XCTAssertTrue(sot.users.isEmpty)
           
           sot.getUsers()
           
           XCTAssertEqual(sot.users.count, 1)
       }

}
