import SwiftUI

struct ContentView: View {
    
    @StateObject var contentModel = ContentModel()
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        if let beers = contentModel.fetchedBeers {
            ZStack {
                VStack {
                    TabView(selection: $selectedTab) {
                        MainView(beers: beers)
                            .tag(Tab.house)
                        FavouritesView(beers: beers)
                            .tag(Tab.heart)
                        SearchView()
                            .tag(Tab.magnifyingglass)
                    }
                    .environmentObject(contentModel)
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
        } else {
            ProgressView()
        }
    }
}
