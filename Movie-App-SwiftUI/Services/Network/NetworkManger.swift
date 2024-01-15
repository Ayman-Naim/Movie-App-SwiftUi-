//
//  NetworkManger.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 10/01/2024.
//

import Foundation
class NetworkManger{
    static let sharedApi = NetworkManger()
    private init(){}
    
  
    
    
    @MainActor
    func getData<T:Decodable>(url : UrlEndPoints,decodingModel:T.Type,completion: @escaping (Result<T,Error>)->Void) async throws {
        do {
            guard let url  = URL(string: url.Url)else{ throw ApiError.badRequest /*invaild url */}
            let (data , response) = try await URLSession.shared.data(from: url)
            guard  (response as? HTTPURLResponse )?.statusCode == 200 else{
                let status  = (response as? HTTPURLResponse )?.statusCode
                switch status{
                case 400 :throw ApiError.badRequest
                case 401 :throw ApiError.unAuthoried
                case 403 :throw ApiError.forbidden
                case 404 :throw ApiError.notFound
                case 407 :throw ApiError.authonticationRequired
                case 408 :throw ApiError.requestTimeOut
                case 500 :throw ApiError.serverError
                default  :throw ApiError.serverError
                }
                
            }
            guard let result =  try? JSONDecoder().decode(T.self , from: data) else { throw ApiError.invalidData }
            completion(.success(result))
            
        }catch{
            completion(.failure(error))
        }
     
        
        
    }
}
