import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.theme.navigation)
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.gray)
                            TextField("Search beer", text: $contentModel.search)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                        }
                        .padding(.all, 10)
                    }
                    .frame(height: 30)
                    .padding()
                    
                    ScrollView {
                        if let result = contentModel.searchedBeers {
                            if result.isEmpty {
                                Text("Nothing found.")
                                    .font(.custom("Raleway-Regular", size: 18))
                                    .foregroundColor(Color.theme.text)
                            } else {
                                ForEach(result) { result in
                                    NavigationLink {
                                        BeerDetails(beer: result)
                                    } label: {
                                        SearchRow(beer: result)
                                    }
                                }
                            }
                        } else {
                            if contentModel.search != "" {
                                ProgressView()
                                    .padding(.top)
                            }
                        }
                    }
                    .padding(.bottom, 80)
                }
            }
            .navigationTitle("Explore")
        }
        .accentColor(Color.theme.secondary)
    }
}
