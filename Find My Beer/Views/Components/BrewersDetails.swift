import SwiftUI

struct BrewersDetails: View {
    
    @EnvironmentObject var contentModel: ContentModel
    var beer: Beer
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Tips:")
                            .secondaryText(size: 23)
                        
                        Text(beer.brewersTips ?? "Tips not specified for this beer.")
                            .normalText(size: 15)
                    }
                    
                    Divider()
                    
                    if let ingredients = beer.ingredients {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients:")
                                .secondaryText(size: 23)
                            
                            MaltsView(beer: beer, ingredients: ingredients)
                            
                            HopsView(beer: beer, ingredients: ingredients)
                            
                            YeastView(beer: beer, ingredients: ingredients)
                        }
                        
                        
                        Divider()
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Method:")
                            .secondaryText(size: 23)
                        
                        MethodView(beer: beer)
                    }
                    
                }
                .padding(.bottom, 80)
                .padding()
            }
        }
    }
}

extension BrewersDetails {
    var method: some View {
        VStack(alignment: .leading) {
            ForEach(beer.method!.mashTemp!) { mash in
                Text("Mash temperature - \(String(mash.temp!.value!)) \(mash.temp!.unit!)")
                //error
                if let duration = mash.duration {
                    Text("Duration: \(String(duration)) minutes.")
                } else {
                    Text("Specific duration not estimated.")
                }
            }
            Text("Fermentation - \(String(beer.method!.fermentation!.temp!.value!)) \(beer.method!.fermentation!.temp!.unit!)")
        }
        .normalText(size: 15)
        .padding(.bottom, 5)
    }
}
