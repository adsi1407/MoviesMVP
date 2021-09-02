import Alamofire
protocol NetworkingDelegate: AnyObject {
    func fetchMovies(completion: @escaping([Movie]?)->Void)
}
