//
//  HomeVM.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 10/01/2024.
//

import Foundation
class HomeVM : ObservableObject {
    @Published var moviesList = [result]()
    @Published var error : ApiError?
    var currentPage = 1
    var totalPages:Int?
    var sortOption:UrlEndPoints = .TopRated
    init() {
        loadMovies()
    }
    
    
    func loadMovies(){
        Task(priority: .medium) {
            UrlEndPoints.page = currentPage
            try await NetworkManger.sharedApi.getData(url: sortOption, decodingModel: MovieModel.self, completion: { result in
                switch result {
                case.success(let moviesData):
                    self.totalPages = moviesData.totalPages
                    self.moviesList.append(contentsOf: moviesData.results)
                 //   print(moviesData.results)
                case .failure(let error ):
                    print("debugtheError:",error)
                    self.error = error  as? ApiError
                }
            })
        }
    }
    func handleRefresh(){
        self.moviesList.removeAll()
        self.loadMovies()
        
    }
}
