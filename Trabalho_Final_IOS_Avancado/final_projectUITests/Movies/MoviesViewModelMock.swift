//
//  MoviesViewModelMock.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation

@testable import final_project

class MoviesViewModelMock: MoviesViewModelType {
    var reloadCollection: (() -> Void)?
    
    var model: MoviesModelType
    var service: MoviesServiceType
    
    var didCalledInitTimes = 0
    var didCalledGetMovies = 0
    
    required init(model: MoviesModelType, service: MoviesServiceType) {
        self.model = model
        self.service = service
        
        didCalledInitTimes += 1
    }
    
    func getMovies(){
        self.didCalledGetMovies += 1
    }
}
