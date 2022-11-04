import Foundation

// MARK: - Beer
struct Beer: Codable, Identifiable {
    let id: Int?
    let name, tagline, firstBrewed, beerDescription: String?
    let imageURL: String?
    let abv, ibu, targetFg, targetOg: Double?
    let ebc: Double?
    let srm, ph, attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips, contributedBy: String?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case beerDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

// MARK: - BoilVolume
struct BoilVolume: Codable {
    let value: Double?
    let unit: String?
}

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

// MARK: - Hop
class Hop: Codable, Identifiable {
    let name: String?
    let amount: BoilVolume?
    let add, attribute: String?
}

// MARK: - Malt
class Malt: Codable, Identifiable {
    let name: String?
    let amount: BoilVolume?
}

// MARK: - Method
struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation
    }
}

// MARK: - Fermentation
struct Fermentation: Codable {
    let temp: BoilVolume?
}

// MARK: - MashTemp
class MashTemp: Codable, Identifiable {
    let temp: BoilVolume?
    let duration: Int?
}
