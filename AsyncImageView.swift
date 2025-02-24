import SwiftUI

struct AsyncImageView: View {
    let imageURL: String?

    @State private var downloadedImage: Image? = nil

    var body: some View {
        VStack {
            if let image = downloadedImage {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                placeholder
            }
        }
       .onAppear {
        loadImage()
        }
    }

    private var placeholder: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame(width: 100, height: 100)
    }

    private func loadImage() {
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            return
       }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let uiImage = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.downloadedImage = Image(uiImage: uiImage)
            }
        }
        .resume()
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(imageURL: Product.dummy.image)
    }
}
