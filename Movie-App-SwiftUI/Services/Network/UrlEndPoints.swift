//
//  UrlEndPoints.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//

import Foundation

import Foundation
enum UrlEndPoints: String ,CaseIterable {

    static private let baseURL = "https://api.themoviedb.org/3/movie/"
    static  let imageBaseUrl = "https://image.tmdb.org/t/p/w185//"
    static  var page = 1
    static var movieId : Int?
    static private let apiKey = "9d48d657ee568bf7cbdbe5a84198f48e"
    case TopRated
    case MostPopular
    case ImagesFetch
    var Url:String {
        switch self{
        case.MostPopular  : return "\(UrlEndPoints.baseURL)popular?&page=\(UrlEndPoints.page)&api_key=\(UrlEndPoints.apiKey)"
        case.TopRated : return "\(UrlEndPoints.baseURL)top_rated?&page=\(UrlEndPoints.page)&api_key=\(UrlEndPoints.apiKey)"
        case.ImagesFetch : return "\(UrlEndPoints.baseURL)\(UrlEndPoints.movieId!)/images?api_key=\(UrlEndPoints.apiKey)"
        }
    }
    
    
    
    
}
