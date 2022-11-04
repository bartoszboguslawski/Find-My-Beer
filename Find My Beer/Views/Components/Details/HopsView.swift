import SwiftUI

struct HopsView: View {
    
    var beer: Beer
    var ingredients: Ingredients
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Hops:")
                .normalText(size: 18)
            
            if let hops = ingredients.hops {
                ForEach(hops) { hop in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(hop.name ?? "n/a")
                        
                        if let add = hop.add, let amount = hop.amount, let value = amount.value, let unit = amount.unit {
                            Text("- \(value, specifier: "%.1f") \(unit), \(add)")
                        }
                    }
                }
                .normalText(size: 15)
            }
        }
    }
}
