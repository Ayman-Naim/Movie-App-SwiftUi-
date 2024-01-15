//
//  HomeView.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//

import SwiftUI

struct HomeView: View {
    let Coloumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    init() {
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    @StateObject private var viewModel = HomeVM()
    @State  var filter = menuItems.topRated
    @State var showAlert = false
  
    @State var ScreenSize : CGSize = .zero
    
    var body: some View {
        
        
        NavigationStack{
            ScrollView{
                
                LazyVGrid(columns: Coloumns){
                    
                    ForEach(viewModel.moviesList.indices,id:\.self){ index in
                        // Color.orange.frame(width: 100, height: 100)
                        let rate = viewModel.moviesList[index].movieRating/2.0
                        AsyncImage(url:viewModel.moviesList[index].imageUrl ){ image in
                            
                            
                            NavigationLink(destination: MovieDetails(rating:rate,MovieDetails: $viewModel.moviesList[index])) {
                                
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                                    .padding(5)
                            }
                        }placeholder: {
                            Image("placeHolder")
                        }.onAppear{
                            if index == viewModel.moviesList.count-1{
                                if viewModel.currentPage<viewModel.totalPages ?? 1 {
                                    viewModel.currentPage += 1
                                    viewModel.loadMovies()
                                }
                                
                            }
                        }
  
                    }
                }.onReceive(viewModel.$error) { error  in
              
                    if error != nil {
                        showAlert.toggle()
                    }
                }
               
                
            } .refreshable {
                viewModel.handleRefresh()
            }
          
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    HStack{

                        
                        Menu {
                            Picker("Sort", selection: $filter) {
                                ForEach(menuItems.allCases) {
                                    Text($0.title)
                                }
                            }
                        } label: {
                            Image("sort")
                        }
                    }
                    
                }
            
            }
            
            .onChange(of: filter, perform: { newValue in
                if newValue.rawValue != viewModel.sortOption.rawValue{
                    viewModel.sortOption = newValue.title == UrlEndPoints.TopRated.rawValue ? UrlEndPoints.TopRated:UrlEndPoints.MostPopular
                }
                viewModel.currentPage = 1
                viewModel.handleRefresh()
            })
            .background(Color("gray"))
            .navigationTitle(filter.title)
            .navigationBarTitleDisplayMode(.inline)
            
            
        }.alert(isPresented: $showAlert, content: {
            Alert(title: Text("Error"),message: Text(viewModel.error?.description ?? ""))
        })
        
        .ignoresSafeArea()
        
        
    }
    func placeOrder() { }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

