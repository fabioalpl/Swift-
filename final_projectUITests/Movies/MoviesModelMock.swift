//
//  MoviesModelMock.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation
@testable import final_project

class MoviesModelMock: MoviesModelType {
    func setMovies(response: Data?) {
        didCalledSetMoviesTimes += 1
    }
    
    var movies: [Movies] = []
    var didCalledGetMoviesTimes = 0
    var didCalledSetMoviesTimes = 0
    
    func getMovies(completion: @escaping (Data?, Error?) -> Void){
        didCalledGetMoviesTimes += 1
    }
}
