import Foundation
import Combine

class ContentModel: ObservableObject {
    
    @Published var fetchedBeers: [Beer]?
    @Published var searchedBeers: [Beer]?
    
    @Published var currentPage: Int = 1
    
    @Published var search = ""
    private var searchCancellable: AnyCancellable? = nil
    
    @Published var favBeers: Set<Int>
    private var saveKey: String = "Fav"
    private var favDB = Favourites()
    
    init() {
        self.favBeers = favDB.load()
        
        updateBeers()
        
        searchCancellable = $search
            .removeDuplicates()
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink(receiveValue: { string in
                if string == "" {
                    self.searchedBeers = nil
                } else {
                    self.searchBeer()
                }
            })
    }
    
    //MARK: API functions
    
    func fetchBeers() async throws {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(currentPage)&per_page=20") else {
            throw URLError(.badURL)
        }
        
        let response = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([Beer].self, from: response.0)
        
        await MainActor.run(body: {
            if fetchedBeers == nil {
                fetchedBeers = []
            }
            fetchedBeers?.append(contentsOf: result)
        })
    }
    
    func updateBeers() {
        currentPage += 1
        Task {
            do {
                try await fetchBeers()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func searchBeer()  {
        let query = search.replacingOccurrences(of: " ", with: "_")
        let url = URL(string: "https://api.punkapi.com/v2/beers?beer_name=\(query)")
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url!) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {
                print("no data found")
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Beer].self, from: data)
                
                DispatchQueue.main.async {
                    if self.searchedBeers == nil {
                        self.searchedBeers = result
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    //MARK: Favourites functions
    
    func contains(_ beer: Beer) -> Bool {
        favBeers.contains(beer.id!)
    }
    
    func toggleFavs(_ beer: Beer) {
        if contains(beer) {
            favBeers.remove(beer.id!)
        } else {
            favBeers.insert(beer.id!)
        }
        favDB.save(items: favBeers)
    }
}
