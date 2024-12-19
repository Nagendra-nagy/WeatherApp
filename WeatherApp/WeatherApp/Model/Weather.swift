//
//  Weather.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import Foundation

struct Weather: Codable, Identifiable {
    let id: Int? // Unique ID
    let name: String? // City name
    let main: Main? // Main weather data
    let weather: [WeatherData]? // List of weather data
    let wind: Wind? // Wind details
    let sys: Sys? // Country and timezone info
}

// MARK: - Main Weather Data
struct Main: Codable {
    let temp: Double? // Current temperature
    let feelsLike: Double? // Feels like temperature
    let tempMin: Double? // Minimum temperature
    let tempMax: Double? // Maximum temperature
    let humidity: Int? // Humidity percentage

    // Map coding keys to snake_case keys from the API
    private enum CodingKeys: String, CodingKey {
        case temp, feelsLike = "feels_like", tempMin = "temp_min", tempMax = "temp_max", humidity
    }
}

// MARK: - Weather Condition
struct WeatherData: Codable {
    let id: Int? // Unique ID
    let main: String? // Current weather (e.g., Rain, Snow)
    let description: String? // Weather description
    let icon: String? // Icon code
}

// MARK: - Wind Data
struct Wind: Codable {
    let speed: Double? // Wind speed in meters/second
    let deg: Int? // Wind direction in degrees
}

// MARK: - System Data
struct Sys: Codable {
    let country: String? // Country code (e.g., "US")
    let sunrise: TimeInterval? // Sunrise time in UNIX timestamp
    let sunset: TimeInterval? // Sunset time in UNIX timestamp
}

