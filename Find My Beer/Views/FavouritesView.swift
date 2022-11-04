import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var beers: [Beer]
    var filteredBeers: [Beer] {
        return beers.filter { contentModel.favBeers.contains($0.id!) }
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                if filteredBeers.isEmpty {
                    Text("Nothing to show.")
                        .font(.custom("Raleway-Regular", size: 18))
                        .foregroundColor(Color.theme.text)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredBeers) { model in
                                NavigationLink {
                                    BeerDetails(beer: model)
                                } label: {
                                    BeerRow(beer: model)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 80)
                    .padding(.top, 30)
                }
            }
            .navigationTitle("Favourites")
        }
        .accentColor(Color.theme.secondary)
    }
}
