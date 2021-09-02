import Alamofire

class NetworkingMovies: NetworkingDelegate {
    private let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func fetchMovies(completion: @escaping([Movie]?)->Void) {
        if isConnectionEnabled() {
            networking.fetchMovies(completion: completion)
        } else {
            completion(nil)
        }
    }
    
    private func isConnectionEnabled() -> Bool {
        guard let connection = NetworkReachabilityManager() else {
            return false
        }
        return connection.isReachable
    }
    
}
