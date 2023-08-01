//
//  MoviesViewModel.swift
//  final_project

import Foundation

protocol MoviesViewModelType {
    init(model: MoviesModelType, service: MoviesServiceType)
    func getMovies()
    
    var model: MoviesModelType { get }
    var service: MoviesServiceType { get }
    
    var reloadCollection: (() -> Void)? { get set }
}

class MoviesViewModel: MoviesViewModelType {    
     
    let service: MoviesServiceType
    let model: MoviesModelType
    
    var reloadCollection: (() -> Void)?
    
    required init(model movies: MoviesModelType, service: MoviesServiceType) {
        self.model = movies
        self.service = service
    }
    
    func getMovies() {
        service.getMovies { [weak self] data, error in
            self?.model.setMovies(response: data)
            self?.reloadCollection?()
        }
    }
}

