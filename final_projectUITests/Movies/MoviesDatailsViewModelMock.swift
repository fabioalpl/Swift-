//
//  MoviesDatailsViewModelMock.swift
//  final_projectUITests
//
//  Created by user239587 on 7/31/23.
//

import Foundation

@testable import final_project

class MoviesDetailsViewModelMock: MovieDetailsViewModelType {
    
    var didCalledfetchMovies = 0
    
    required init(model: MoviesDetailsModelType) {
        self.model = model
    }
    
    func fetchMovie(movieId: String) {
        didCalledfetchMovies += 1
    }
    
    var movie: MovieDetails?
    
    var model: MoviesDetailsModelType
    
    var updateMovieDetails: (() -> Void)?
    
}
