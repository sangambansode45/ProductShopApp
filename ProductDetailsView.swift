import SwiftUI

struct ProductDetailsView: View {
    var products: [Product]
    @State var index: Int

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    if index > 0 {
                        index -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                }
                .opacity(index == 0 ? 0 : 1)

                Spacer()

                AsyncImageView(imageURL: products[index].image)
                    .scaledToFit()
                    .frame(height: 300)

                Spacer()

                Button(action: {
                    if index < products.count - 1 {
                        index += 1
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .opacity(index == products.count - 1 ? 0 : 1)
            }

            Text(products[index].title)
                .font(.headline)
                .padding(.top)

            Text(products[index].description)
                .font(.footnote)
                .foregroundColor(.secondary)

            RatingInfoView(rating: products[index].rating.rate.toString())

            Spacer()

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Price")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(products[index].price.currencyFormat())
                        .font(.title3)
                        .foregroundColor(Color.blue)
                }
                .padding(.leading)

                Spacer()

                HStack(spacing: 0) {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .background(Color.blue)
                        .cornerRadius(15)

                    Text("Buy Now")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 100, height: 50)
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.trailing)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding()
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(products: [Product.dummy], index: 0)
    }
}



struct RatingInfoView: View {
    var rating: String

    var body: some View {
        HStack {
            Text("Rating: \(rating)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
