import SwiftUI

struct MaltsView: View {
    
    var beer: Beer
    var ingredients: Ingredients

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Malts:")
                .normalText(size: 18)

            if let malts = ingredients.malt {
                ForEach(malts) { malt in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(malt.name ?? "")
                        if let amount = malt.amount, let value = amount.value, let unit = amount.unit {
                            Text("- \(String(value)) \(unit)")
                        }
                    }
                    .normalText(size: 15)
                }
            }
        }
    }
}
