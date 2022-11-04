import SwiftUI

struct BeerRow: View {
    
    var beer: Beer
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [Color.theme.gradient1, Color.theme.gradient2], startPoint: .bottomLeading, endPoint: .topTrailing))
            
            VStack {
                Text(beer.name ?? "n/a")
                    .normalText(size: 18)
                    .padding()
                Spacer()
                AsyncImage(url: URL(string: beer.imageURL ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(width: 50, height: 200)
                .padding(.bottom)
            }
        }
        .frame(width: 160, height: 300)
        
    }
}
