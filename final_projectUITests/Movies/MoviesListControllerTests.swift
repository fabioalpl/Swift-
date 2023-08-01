//
//  MoviesListControllerTests.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation
import XCTest

@testable import final_project

class MoviesListControllerTests: XCTest {
    
    var sut: MoviesListController!
    
    var viewModel: MoviesViewModelMock!
    
    override func setUp() {
        viewModel = MoviesViewModelMock(model: MoviesModelMock(), service: MoviesServiceMock())
        
        sut = MoviesListController()
        sut.viewModel = viewModel
    }
    
    func test_callViewModel_when_DidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewModel.didCalledGetMovies >= 1)
    }
}
