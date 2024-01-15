//
//  ApiError.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//


import Foundation
enum ApiError :  Error , LocalizedError{
    case badRequest // 400
    case unAuthoried // 401
    case forbidden // 403
    case notFound // 404
    case authonticationRequired //407
    case requestTimeOut // 408
    case serverError //  500
    case offline
    case invalidData
    var description :String {
        switch  self {
        case .badRequest: return "the request syntax is not right "
        case .unAuthoried : return "the authontatcatin is missing place authontatcation header "
        case .forbidden: return "this client is unauthorized "
        case .notFound : return "Not Found "
        case .authonticationRequired :return  "client must first authenticate itself with the proxy"
        case .requestTimeOut:return "Request Timeout"
        case .serverError:return "Internal Server Error"
        case .offline : return  "You are offline check your network "
        case .invalidData : return  "invalid data response cant decode it "
        }
    }
    
    
    
}
