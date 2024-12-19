//
//  TemperatureTextView.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 19/12/24.
//

import SwiftUI

struct TemperatureTextView: View {
    var temp: Int
    
    var body: some View {
        return Text("Temperature : \(temp)°C")
            .font(.title2)
            .accessibilityIdentifier("TemperatureText")
    }
}

struct TemperatureTextView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureTextView(temp: 20)
    }
}
