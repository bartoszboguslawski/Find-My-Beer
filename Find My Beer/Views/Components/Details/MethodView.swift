import SwiftUI

struct MethodView: View {
    
    var beer: Beer
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            if let method = beer.method, let mashTemp = method.mashTemp {
                ForEach(mashTemp) { mash in
                    if let temp = mash.temp, let value = temp.value, let unit = temp.unit {
                        Text("Mash temperature - \(String(value)) \(unit)")
                        if let duration = mash.duration {
                            Text("Duration: \(String(duration)) minutes.")
                        } else {
                            Text("Specific duration not estimated.")
                        }
                    }
                }
                if let fermentation = method.fermentation, let temp = fermentation.temp, let value = temp.value, let unit = temp.unit {
                    Text("Fermentation - \(value, specifier: "%.1f") \(unit)")
                }
            }
            
        }
        .normalText(size: 15)
    }
}
