//
//  MovieDetailsModelMock.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation

@testable import final_project

class MovieDetailsModelMock: MoviesDetailsModelType {
    var didCalledGetDetails = 0
    
    func getDetails(movieId: String, completion: @escaping (Data?, Error?) -> Void) {
        didCalledGetDetails += 1
    }
    
}
