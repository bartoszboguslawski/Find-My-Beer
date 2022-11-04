import SwiftUI

struct BeerDetails: View {
    
    @EnvironmentObject var contentModel: ContentModel
    var beer: Beer
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    HStack(alignment: .top) {
                        Text(beer.name ?? "n/a")
                            .secondaryText(size: 50)
                        Spacer()
                        Button {
                            contentModel.toggleFavs(beer)
                        } label: {
                            Image(systemName: contentModel.contains(beer) ? "heart.fill" : "heart")
                                .resizable()
                                .foregroundColor(Color.theme.secondary)
                                .frame(width: 30, height: 30)
                                .padding()
                        }
                    }
                    
                    Text(beer.tagline ?? "")
                        .normalText(size: 18)
                    
                    beerImage

                    Text("First brewed: " + (beer.firstBrewed ?? "n/a"))
                        .normalText(size: 18)
                    
                    Text(beer.beerDescription ?? "No description available.")
                        .normalText(size: 15)
                    
                    if let abv = beer.abv {
                        Text("Alcohol content: \(abv, specifier: "%.1f")%")
                            .normalText(size: 15)
                    } else {
                        Text("Alcohol content not specified.")
                            .normalText(size: 15)
                    }
                    
                    if let pairing = beer.foodPairing {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Best to pair with:")
                                .normalText(size: 18)
                            
                            ForEach(pairing, id: \.self) { food in
                                Text("- \(food)")
                                    .normalText(size: 15)
                            }
                        }
                    }
                    
                    NavigationLink {
                        BrewersDetails(beer: beer)
                    } label: {
                        HStack {
                            Text("Information for brewers")
                                .secondaryText(size: 18)
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(Color.theme.secondary)
                    }
                }
                .padding()
                .padding(.bottom, 80)
            }
        }
    }
}

extension BeerDetails {
    var beerImage: some View {
        HStack() {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(colors: [Color.theme.secondary, Color.theme.gradient2], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .shadow(radius: 6)
                    .frame(height: 540)
                AsyncImage(url: URL(string: beer.imageURL ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(width: 150, height: 500)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
