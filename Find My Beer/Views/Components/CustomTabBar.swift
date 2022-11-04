import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case heart
    case magnifyingglass
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    @Namespace var animation
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                VStack {
                    Image(systemName: tab.rawValue)
                        .resizable()
                        .foregroundColor(selectedTab == tab ? Color.theme.secondary : Color.gray)
                        .scaledToFit()
                        .frame(width: 25)
                    if selectedTab == tab {
                        Capsule()
                            .frame(width: 30,height: 3)
                            .foregroundColor(Color("TabText"))
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .frame(width: 30,height: 3)
                            .foregroundColor(.clear)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedTab = tab
                    }
                }
                Spacer()
            }
        }
        .frame(width: nil, height: 60)
        .background(Color("Navigation"))
        .cornerRadius(10)
        .padding()
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBar(selectedTab: .constant(.house))
        }
    }
}
