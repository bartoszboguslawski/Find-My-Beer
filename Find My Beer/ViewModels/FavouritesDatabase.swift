import Foundation

class Favourites {
    private var saveKey: String = "Fav"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: saveKey)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: saveKey) as? [Int] ?? [Int]()
        return Set(array)
    }
}
