import SwiftUI

struct YeastView: View {
    
    var beer: Beer
    var ingredients: Ingredients
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Yeast:")
                .normalText(size: 18)
            
            if let yeast = ingredients.yeast {
                Text(yeast)
                    .normalText(size: 15)
            }
        }
    }
}
