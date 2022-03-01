//
//  ContentView.swift
//  AsyncImageUI
//
//  Created by Iurie Guzun on 2022-02-28.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.cyan)
            .opacity(0.7)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //MARK: - 1. Basic
        //AsyncImage(url: URL(string: imageURL))
        //MARK: - 2. Scale
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        //MARK: - 3. Placeholder
        /*
        AsyncImage(url: URL(string: imageURL)) {
            image in image
            .imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
            .iconModifier()
        }
        .padding(40)
         */
        //MARK: - 4. Phase
        /*
        AsyncImage(url: URL(string: imageURL)) { phase in
            //Success: The image successfully loaded.
            //Failure: The image failed to load with an error,
            //Empty: No image is loaded
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
        */
        
        //MARK: - 5. Animation
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image): image.imageModifier()
            case .failure(_): Image(systemName: "ant.circle.fill").iconModifier()
            case .empty: Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

