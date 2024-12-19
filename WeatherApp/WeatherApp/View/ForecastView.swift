//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 18/12/24.
//

import SwiftUI

struct ForecastView: View {
    @StateObject private var viewModel = WeatherViewModel(weatherRepository: WeatherRepositoryImpl())
    @State private var city = "Pune"

    var body: some View {
        VStack {
            TextField("Enter city", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                Task {
                    await viewModel.fetchForecast(for: city)
                }
            }) {
                Text("Fetch Forecast")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .accessibilityIdentifier("FetchForecastButton")
            }
            .padding()

            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let errorMessage = viewModel.errorString {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                List(viewModel.forecast?.list ?? [], id: \.id) { forecast in
                    VStack(alignment: .leading) {
                        if let forecastDate = forecast.dt{
                            let formattedDate = viewModel.formatDate(forecastDate: forecastDate)
                            DateTextView(forecastDate: formattedDate)
                        }
                        
                        if let temp = forecast.main?.temp {
                            let formattedTemp = viewModel.formatTemperature(temp: temp)
                            TemperatureTextView(temp: formattedTemp)
                        }
                        
                        Text("Weather Forecast : \(forecast.weather?.first?.description ?? "")")
                            .font(.headline)
                            .accessibilityIdentifier("WeatherText")
                        Text("Wind Speed : \(forecast.wind?.speed ?? 0.0) m/sec")
                            .font(.subheadline)
                            .accessibilityIdentifier("WindSpeedText")
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Forecast")
    }
}

struct DateTextView : View {
    var forecastDate: String
    var body: some View {
        return Text("Date : \(forecastDate)")
            .font(.title)
            .padding()
            .accessibilityIdentifier("DateText")
    }
}
