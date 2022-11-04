import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    var beers: [Beer]

    private let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                ScrollView {
                    
                    HStack {
                        Text("Welcome to Find My Beer.")
                            .secondaryText(size: 45)
                        Spacer()
                    }
                    .padding()
                    
                    description
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(beers) { model in
                            NavigationLink {
                                BeerDetails(beer: model)
                            } label: {
                                BeerRow(beer: model)
                            }
                        }
                    }
                    
                    Button(action: {
                        DispatchQueue.main.async {
                            contentModel.updateBeers()
                        }
                    }, label: {
                        Text("Load more")
                            .font(.custom("Raleway-Regular", size: 18))
                        .foregroundColor(Color.theme.secondary)
                    })
                    .padding()
                    .padding(.bottom, 90)
                }
            }
            .navigationBarHidden(true)
//            .navigationTitle("Find Your Beer")
        }
        .accentColor(Color.theme.secondary)
    }
}

extension MainView {
    var description: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [Color.theme.gradient3, Color.theme.gradient4], startPoint: .bottomLeading, endPoint: .topTrailing))
                .shadow(radius: 6)
            VStack(alignment: .leading, spacing: 20) {
                Text("In this place you will find your next favourite beer.")
                    .normalText(size: 20)
                Text("Start by checking the list below or search for a beer via explorer.")
                    .normalText(size: 15)
            }
            .padding()
        }
        .frame(width: 360, height: 160)
    }
}
