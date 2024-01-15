//
//  MenuItems.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 10/01/2024.
//

import Foundation

enum menuItems: String, CaseIterable, Identifiable {
   
    case topRated
    case popular
    var id: Self { return self }

    var title: String {
        switch self {
            
            case .topRated:
            return UrlEndPoints.TopRated.rawValue
            case .popular:
            return UrlEndPoints.MostPopular.rawValue
        }
    }
}
