import SwiftUI

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.products.enumerated()), id: \.element.id) { index, product in
                    NavigationLink(destination: ProductDetailsView(products: viewModel.products, index: index)) {
                        ProductRowView(product: product)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Products")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
