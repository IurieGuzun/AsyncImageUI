//
//  ContentView.swift
//  AsyncImageUI
//
//  Created by Iurie Guzun on 2022-02-28.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //MARK: - 1. Basic
//        AsyncImage(url: URL(string: imageURL))
        AsyncImage(url: URL(string: imageURL), scale: 3.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
