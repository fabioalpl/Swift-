//
//  MovieDetails.swift
//  final_project
//
//  Created by Jackson on 16/08/22.
//

import Foundation

protocol MovieDetailsViewModelType {
    init(model: MoviesDetailsModelType)
    func fetchMovie(movieId: String)
    
    var movie: MovieDetails? { get }
    
    var model: MoviesDetailsModelType { get }
    
    var updateMovieDetails: (() -> Void)? { get set }
    
}

class MovieDetailsViewModel: MovieDetailsViewModelType {
    
    var movie: MovieDetails?
    var model: MoviesDetailsModelType
    
    var updateMovieDetails: (() -> Void)?
    
    required init(model: MoviesDetailsModelType) {
        self.model = model
    }
    
    func fetchMovie(movieId: String) {
        model.getDetails(movieId: movieId, completion: { [weak self] data, error in
            let responseData = try? JSONDecoder().decode(MovieDetails.self, from: data!)
            self?.movie = responseData
            self?.updateMovieDetails?()
        })
    }
}
