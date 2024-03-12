//
//  SearchViewWrapper.swift
//  Dota2Technopark
//
//  Created by Grigory Don on 12.03.2024.
//

import SwiftUI

struct SearchViewWrapper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SearchView
    
    func makeUIViewController(context: Context) -> SearchView {
        return SearchView()
    }
    
    func updateUIViewController(_ uiViewController: SearchView, context: Context) {
    }
}
