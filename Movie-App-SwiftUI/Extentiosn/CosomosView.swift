//
//  CosomosView.swift
//  Movie-App-SwiftUI
//
//  Created by ayman on 09/01/2024.
//


import SwiftUI
import Cosmos

// A SwiftUI wrapper for Cosmos view
struct MyCosmosView: UIViewRepresentable {
    @Binding var rating: Double

    func makeUIView(context: Context) -> CosmosView {
        CosmosView()
    }

    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    
        // Autoresize Cosmos view according to it intrinsic size
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Change Cosmos view settings here
        uiView.settings.starSize = 45
        uiView.settings.updateOnTouch = false
        uiView.settings.fillMode = .precise
        uiView.settings.totalStars = 5
    }
}
