//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import SwiftUI

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var weather: Weather?
    @Published var errorString: String?
    @Published var forecast: Forecast?
    private let weatherRepository: WeatherRepository

    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }

    func fetchWeather(for city: String) async {
        do {
            weather = try await weatherRepository.getCurrentWeather(city: city)
        } catch {
            errorString = error.localizedDescription
        }
    }
    
    func fetchForecast(for city: String) async {
        do {
            isLoading = true
            defer { isLoading = false }
            forecast = try await weatherRepository.getForecast(city: city)
        } catch {
            errorString = error.localizedDescription
        }
    }
    
    func formatDate(forecastDate: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: forecastDate)
        return Constants.shortDateFormatter.string(from: date)
    }
    
    func formatTemperature(temp: Double) -> Int {
        return Int(temp - Constants.kelvinToCelsiusDifference)
    }
}
