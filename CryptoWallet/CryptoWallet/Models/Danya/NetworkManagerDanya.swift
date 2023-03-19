/*
import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManagerDanya: NSObject {
    
    static let shared = NetworkManager()
    
    private override init() {}
    
    public func getAllCoinsData(
        completion: @escaping ([CryptoCoin]) -> Void
    ) {
        let group = DispatchGroup()
        
        var result = [CryptoCoin]()
        
        NetworkConstant.coinNames.allCases.forEach { names in
            group.enter()
            
            guard let url = URL(string: names.coinURL) else {
                print(NetworkError.invalidURL)
                group.leave()
                return
            }
            
            URLSession.shared.dataTask(with: url)
            { dataResponse, urlResponse, error in
                
                guard error == nil,
                      let myResponse = urlResponse,
                      let data = dataResponse else {
                    group.leave()
                    return
                    
                }
                
                print("Code \(String(describing: (myResponse as? HTTPURLResponse)?.statusCode))")
    
                do {
                    let resultData = try JSONDecoder().decode(
                        CryptoCoin.self, from: data
                    )
                    result.append(resultData)
                    group.leave()
                }
                catch {
                    print(NetworkError.decodingError)
                    group.leave()
                }
            }
            .resume()
        }
        
        group.notify(queue: .main) {
            completion(result)
        }
    }
    
    func fetchImage(
        from url: URL?,
        completion: @escaping(Result<Data, NetworkError>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                print("image error")
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
        
    }
    
}

*/
