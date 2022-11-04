import SwiftUI

struct SearchRow: View {
    
    var beer: Beer
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            HStack {
                Text(beer.name ?? "n/a")
                    .secondaryText(size: 18)
                Spacer()
                Text(beer.tagline ?? "")
                    .normalText(size: 14)
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.theme.text)
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}
