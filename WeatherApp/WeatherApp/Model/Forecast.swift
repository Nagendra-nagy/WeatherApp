//
//  Forecast.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import Foundation

struct Forecast: Codable, Identifiable {
    let id = UUID() // Unique identifier
    let city: City? // City information
    let list: [ForecastData]? // List of forecast data

    // Custom CodingKeys for JSON decoding
    private enum CodingKeys: String, CodingKey {
        case city
        case list
    }
}

// MARK: - Forecast Entry
struct ForecastData: Codable, Identifiable {
    let id = UUID() // Unique identifier
    let dt: TimeInterval? // Date and time in UNIX timestamp
    let main: Main? // Main weather data
    let weather: [WeatherData]? // List of weather data
    let wind: Wind? // Wind details
    let dtTxt: String? // Date and time in text

    private enum CodingKeys: String, CodingKey {
        case dt, main, weather, wind
        case dtTxt = "dt_txt"
    }
}

// MARK: - City Information
struct City: Codable {
    let name: String? // City name
    let country: String? // Country code
    let timezone: Int? // Timezone offset in seconds
    let sunrise: TimeInterval? // Sunrise time in UNIX timestamp
    let sunset: TimeInterval? // Sunset time in UNIX timestamp
}

