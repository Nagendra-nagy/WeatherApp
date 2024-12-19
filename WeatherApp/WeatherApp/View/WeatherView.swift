//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel(weatherRepository: WeatherRepositoryImpl())

    var body: some View {
        VStack {
            if let weather = viewModel.weather {
                Text("City: \(weather.name ?? "")")
                    .accessibilityIdentifier("CityText")
                
                if let temp = weather.main?.temp {
                    let formattedTemp = viewModel.formatTemperature(temp: temp)
                    TemperatureTextView(temp: formattedTemp)
                }
                
                Text("Condition: \(weather.weather?.first?.description ?? "N/A")")
                    .accessibilityIdentifier("ConditionText")
            } else if let errorString = viewModel.errorString {
                Text("Error \(errorString)")
                    .accessibilityIdentifier("ErrorText")
            } else {
                ProgressView("Loading...")
                    .accessibilityIdentifier("ProgressView")
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchWeather(for: "London")
            }
        }
        .padding()
        .navigationTitle("Current Weather")
    }
}
