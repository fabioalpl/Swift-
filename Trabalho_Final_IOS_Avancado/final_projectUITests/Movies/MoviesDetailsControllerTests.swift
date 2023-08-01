//
//  MoviesDetailsControllerTests.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation
import XCTest

@testable import final_project

class MoviesDetailsControllerTests: XCTest {
    		
    var sut: MovieDetailsController!
    
    var viewDetailsModel : MoviesDetailsViewModelMock!
    
    override func setUp() {
        viewDetailsModel = MoviesDetailsViewModelMock(model: MovieDetailsModelMock())
        
        sut = MovieDetailsController(coder: NSCoder())
        sut.viewModel = viewDetailsModel
    }
    
    func test_callFetchMovie() {
        sut.viewModel?.fetchMovie(movieId: "2")
        
        XCTAssertTrue(viewDetailsModel.didCalledfetchMovies >= 1)
    }
}
