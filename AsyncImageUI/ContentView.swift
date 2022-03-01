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
    private let imageURL: String = "1https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //MARK: - 1. Basic
        //AsyncImage(url: URL(string: imageURL))
        //MARK: - 2. Scale
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        //MARK: - 3. Placeholder
        AsyncImage(url: URL(string: imageURL)) {
            image in image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.cyan)
                .opacity(0.7)
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

