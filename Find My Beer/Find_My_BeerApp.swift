import SwiftUI

@main
struct Find_My_BeerApp: App {
    
    init() {
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.barTintColor = UIColor(Color.theme.background)
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.text), .font : UIFont(name: "Raleway-Regular", size: 45)!]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
