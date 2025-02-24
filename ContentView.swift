//
//  ContentView.swift
//  Productshopapp
//
//  Created by Apple on 21/02/25.
//

import SwiftUI


let viewModel = ProductViewModel()
struct ContentView: View {
    @State private var products: [Product] = []
    @State private var isFetching = false
//    private let viewModel = ProductViewModel()

    var body: some View {
        VStack {
            Text("Hello, world!").padding()
            
            if isFetching {
                Text("Fetching products...").padding()
            } else {
                List(products, id: \.id) { product in
                    Text(product.title) // Customize as needed
                }
            }
        }
        .onAppear {
            isFetching = true
            viewModel.fetchProducts {
                products = viewModel.products
                isFetching = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




