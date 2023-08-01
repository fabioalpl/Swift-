//
//  MoviesDetailsController.swift
//  final_project

import Foundation
import UIKit

class MovieDetailsController: UIViewController, Coordinating {
     
     var coordinator: Coordinator?
     var viewModel: MovieDetailsViewModelType?
     var movieId: String
    
    private lazy var posterImageView: UIImageView = {
         let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.clipsToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     private lazy var mainTitle: UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = movie?.title
          view.textColor = .black
          return view
     }()
     
     private lazy var voteAverage: UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = String(movie?.voteAverage ?? 0.0)
         view.textColor = .black
         return view
     }()
     
     
     private lazy var voteCount: UILabel = {
          let view = UILabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = String(movie?.voteCount ?? 0)
         view.textColor = .black
         return view
     }()
     
     private lazy var spinner: UIActivityIndicatorView = {
          let view = UIActivityIndicatorView()
          view.style = .large
          view.translatesAutoresizingMaskIntoConstraints = false
          view.startAnimating()
          return view
     }()
     
     var movie: MovieDetails? {
          return viewModel?.movie
     }
     
     init(movieId: String) {
          self.movieId = movieId
          super.init(nibName: nil, bundle: nil)
          super.viewDidLoad()
     }
     
     required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
     }
     
     override func viewDidLoad() {
          self.view.backgroundColor = .white
          
          view.addSubview(posterImageView)
          view.addSubview(mainTitle)
          view.addSubview(voteAverage)
          view.addSubview(voteCount)
         
          setupConstraints()
          bindSetup()
     }
    
    func setupConstraints() {
        // Set initial frame for posterImageView
            posterImageView.frame = CGRect(x: 100, y: 100, width: 200, height: 300)
            
        NSLayoutConstraint.activate([
                    posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    posterImageView.widthAnchor.constraint(equalToConstant: 200),
                    posterImageView.heightAnchor.constraint(equalToConstant: 300),

                    mainTitle.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
                    mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                    voteAverage.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
                    voteAverage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                    voteCount.topAnchor.constraint(equalTo: voteAverage.bottomAnchor, constant: 20),
                    voteCount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                ])
                
                // Limit the contentMode of posterImageView to scaleAspectFit
                posterImageView.contentMode = .scaleAspectFit
            }
     func bindSetup() {
          viewModel = MovieDetailsViewModel(model: MovieDetailsModel())
          viewModel?.updateMovieDetails = updateScreen
          viewModel?.fetchMovie(movieId: movieId)
     }
     
    func updateScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.mainTitle.text = "Título: \(self?.viewModel?.movie?.title ?? "")"
            self?.voteAverage.text = "Pontuação Média: \(String(self?.viewModel?.movie?.voteAverage ?? 0.0))"
            self?.voteCount.text = "Total de votos: \(String(self?.viewModel?.movie?.voteCount ?? 0))"
                        
            let imageURLString = "https://image.tmdb.org/t/p/w500" + (self?.viewModel?.movie?.backdropPath ?? "")
            if let imageURL = URL(string: imageURLString) {
                let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                    if let error = error {
                        print("Error fetching image:", error)
                        return
                    }
                    if let data = data, let image = UIImage(data: data) {
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.posterImageView.image = image
                        }
                    }
                }
                task.resume()
            }
        }
    }

     func showLoading() {
          view.addSubview(spinner)
          
          spinner.heightAnchor.constraint(equalToConstant: 200).isActive = true
          spinner.widthAnchor.constraint(equalToConstant: 200).isActive = true
          spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
     }
     
     func hideLoading() {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
               self.spinner.removeFromSuperview()
          }
     }
}

