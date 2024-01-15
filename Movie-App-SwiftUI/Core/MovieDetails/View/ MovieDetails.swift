//
//  SwiftUIView.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//

import SwiftUI

struct MovieDetails: View {
    @State var rating :Double
    @Binding var MovieDetails: result
    
    var body: some View {
        
        GeometryReader{gemoetry in
            
            
            NavigationStack{
                
                ScrollView{
                    
                    ZStack{
                        
                        HStack{
                            AsyncImage(url: MovieDetails.imageUrl){ image in
                                switch image{
                                case.success(let image ):
                                    image
                                        .resizable()
                                        .frame(width: gemoetry.size.width,height: gemoetry.size.width)
                                    
                                case .empty:
                                    Image("placeHolder")
                                case .failure(_):
                                    Image("placeHolder")
                                @unknown default:
                                    Image("placeHolder")
                                }
                            }
                            
               
                        }
                        HStack{
                            AsyncImage(url: MovieDetails.imageUrl){ image in
                                switch image{
                                case.success(let image ):
                                    image
                                        .resizable()
                                        .frame(width: gemoetry.size.width/3,height: gemoetry.size.width/2)
                                    
                                case .empty:
                                    Image("placeHolder")
                                case .failure(_):
                                    Image("placeHolder")
                                @unknown default:
                                    Image("placeHolder")
                                }
                            }
                                                    
                            Text(MovieDetails.originalTitle)
                        }.offset(x: -30,y: gemoetry.size.width/2+50)
                            
                    }
                    
                    
                    VStack(alignment: .leading){
                        Spacer(minLength: gemoetry.size.width/2-50)
                        
                        HStack(spacing: 5){
                            Text("Realese Date:")
                            Text(MovieDetails.releaseDate)
                            
                            
                            
                        }.padding()
                        
                        
                        HStack(spacing: 35){
                            Text("Overview:")
                            
                            Text(MovieDetails.overView)
                            
                        }
                        .padding()
                        
                        HStack(spacing: 55){
                            Text("Rate:")
                            
                            MyCosmosView(rating: $rating)
                            
                        }.padding()
                        
                        
                    }.padding(.leading)
                    
                }
                .foregroundColor(.white)
                .background(Color("gray"))
                .navigationTitle("Movie Details")
                .navigationBarTitleDisplayMode(.inline)
               
            } 
            
            
        }.onAppear{
            
                // Inline Navigation Title color
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            
        }
        
    }
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetails( rating: 3.5, MovieDetails:.constant(result(adult: true, id: 1, originalTitle: "The Family Plans", overView: "Dan Morgan is many things: a devoted husband, a loving father, a celebrated car salesman. He's also a former assassin. And when his past catches up to his present, he's forced to take his unsuspecting family on a road trip unlike any other.Dan Morgan is many things: a devoted husband, a loving father, a ", popularity: 2.5, PosterPath: "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg", releaseDate: "Realese Date:", title: "The Family Plans", movieRating: 5.5)
                                                         ))
    }
}
