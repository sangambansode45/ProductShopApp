import SwiftUI

struct ProductRowView: View {

    let product: Product

    var body: some View {
        HStack(spacing: 8) {
            if URL(string: product.image) != nil {
                AsyncImageView(imageURL:product.image )
         //   productImage(url: url)
         //       if let url = URL(string: product.image) {
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)

                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(product.rating.rate.toString())
                            .fontWeight(.medium)
                    }
                }

                Text(product.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)

                HStack {
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .foregroundColor(Color.blue)

                    Spacer()

                    buyButton
                }
            }
        }
        .padding()
    }

    
 /*  func productImage(url: URL) -> some View {
        Image(url: url) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
    */
    
    
    
    var buyButton: some View {
        Button(action: {}, label: {
            Text("Buy")
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.blue)
                .clipShape(Capsule())
        })
    }
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product.dummy)
    }
}






