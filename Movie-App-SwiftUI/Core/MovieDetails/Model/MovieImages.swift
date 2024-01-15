//
//  MovieImages.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 10/01/2024.
//

import Foundation
struct MovieImages:Decodable{
    let backdrops : [ImageData]
    let id: Int
    let logos : [ImageData]
    let posters  : [ImageData]
    
    
    
}

struct ImageData: Decodable  {
    let file_path :String
}
