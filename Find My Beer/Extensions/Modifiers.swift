import Foundation
import SwiftUI

extension View {
    
    func normalText(size: CGFloat) -> some View {
        self.font(.custom("Raleway-Regular", size: size))
            .foregroundColor(Color.theme.text)
    }
    func secondaryText(size: CGFloat) -> some View {
        self.font(.custom("Raleway-Regular", size: size))
            .foregroundColor(Color.theme.secondary)
    }

}
