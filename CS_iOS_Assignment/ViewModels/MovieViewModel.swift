//
//  MovieViewModel.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

protocol MovieViewModelProtocol {
    var alertMessage: Dynamic<AlertMessage> { get set }
    var isLoaderHidden: Dynamic<Bool> { get set }
    var successResponse: Dynamic<MovieModel.MovieModelRes?> { get set }
    var successPopularMovieResponse: Dynamic<MovieModel.MovieModelRes?> { get set }
    
    func getNowPlayingMovies()
    func getPopularMovies()
}

class MovieViewModel: NSObject, MovieViewModelProtocol {
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    
    var successResponse: Dynamic<MovieModel.MovieModelRes?> = Dynamic(nil)
    var successPopularMovieResponse: Dynamic<MovieModel.MovieModelRes?> = Dynamic(nil)

    private let apiManager = APIManager()
    
    /**
     * Get Now Playing list of movies
     */
    func getNowPlayingMovies() {
        self.apiManager.call(type: EndpointItem.getCurrentlyPlayingMovies, params: nil) { (res: Swift.Result<MovieModel.MovieModelRes,AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let successResponse):
                print(successResponse)
                self.successResponse.value = successResponse
                break
            case .failure(let message):
                self.alertMessage.value = message
                break
            }
        }
    }
    
    /**
    * Get Popular list of movies
    */
    func getPopularMovies() {
           self.apiManager.call(type: EndpointItem.getPopularMovies, params: nil) { (res: Swift.Result<MovieModel.MovieModelRes,AlertMessage>) in
               self.isLoaderHidden.value = true
               switch res {
               case .success(let successResponse):
                   print(successResponse)
                   self.successPopularMovieResponse.value = successResponse
                   break
               case .failure(let message):
                   self.alertMessage.value = message
                   break
               }
           }
       }
    
}
