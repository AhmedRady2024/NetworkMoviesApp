
import SwiftUI
import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var movies: [Movie] = []
    private var cancellables = Set<AnyCancellable>()
    let apiKey = "a3c8ca7436bec5d2e064fa4a503e7fa9"

    init() {
        $query
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .filter { $0.count > 1 }
            .sink { [weak self] value in
                guard let self = self else { return }
                print("\(value)")
                Task {
                    await self.searchMovies(query: value)
                }
            }
            .store(in: &cancellables)
    }
    
    func searchMovies(query: String) async {
        guard !query.isEmpty else {
            DispatchQueue.main.async {
                self.movies = []
            }
            return
        }

        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(queryEncoded)")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let dataResult = try JSONDecoder().decode(Result.self, from: data)
            DispatchQueue.main.async {
                self.movies = dataResult.movies
            }
        } catch {
            print("Error searching movies: \(error)")
        }
    }
}
