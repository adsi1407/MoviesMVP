//
//  MoviesPresenter.swift
//  MoviesMVP
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 22/06/21.
//

import Foundation
import UIKit

protocol MoviesPresenterDelegate: AnyObject {
    func presentMovies(movies: [Movie]?)
    func presentMovie(movie: Movie)
}

typealias MoviesDelegate = MoviesPresenterDelegate & UIViewController

class MoviesPresenter{
    
    private let networking = Networking()
    private let networkingDelegate: NetworkingDelegate
    private weak var delegate: MoviesDelegate?
    
    init(delegate: MoviesDelegate) {
        self.delegate = delegate
        self.networkingDelegate = networking
    }
    
    public func fetchMovies(){
        networkingDelegate.fetchMovies { movies in
            self.delegate!.presentMovies(movies: movies)
        }
    }
    
    public func didTap(movie: Movie){
        self.delegate!.presentMovie(movie: movie)
    }
    
}
