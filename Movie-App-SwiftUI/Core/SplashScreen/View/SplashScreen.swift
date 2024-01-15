//
//  ContentView.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @State var NavigateToAnotherView =  false

    var body: some View {
        VStack{
            NavigationStack{
                
                LottieView(animation: .named("Movie"))
                    .configuration(LottieConfiguration(renderingEngine: .mainThread))
                    .playing()
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false){_ in
                            NavigateToAnotherView.toggle()
                            
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: HomeView())
                        }
                        
                    }.navigationDestination(isPresented: $NavigateToAnotherView) {
                        HomeView().navigationBarBackButtonHidden()
                    }
               
                    
              
                
            }
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
