import Foundation

@objc class ProductViewModel: NSObject ,ObservableObject{
    @Published var products: [Product] = []
    private let manager = APIManager()

    func fetchProducts(completion: @escaping () -> Void = { }) {
        manager.request(url: "https://fakestoreapi.com/products") { (result: Result<[Product], NetworkError>) in
            switch result {
            case .success(let fetchedProducts):
                DispatchQueue.main.async {
                    self.products = fetchedProducts
                    print(fetchedProducts)
                    completion() // Ensure the completion handler is called on the main thread
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Fetch Product error:", error)
                    completion() // Call completion even in case of failure
                }
            }
        }
    }
}
