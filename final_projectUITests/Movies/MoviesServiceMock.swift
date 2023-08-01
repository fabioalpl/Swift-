//
//  MoviesServiceMock.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation
@testable import final_project

class MoviesServiceMock: MoviesServiceType {
    var didCalledGetMoviesTimes = 0
    
    func getMovies(completion: @escaping (Data?, Error?) -> Void) {
        didCalledGetMoviesTimes += 1
    }
}
