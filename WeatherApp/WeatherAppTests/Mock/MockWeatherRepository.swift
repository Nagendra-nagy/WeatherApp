//
//  MockWeatherService.swift
//  WeatherAppTests
//
//  Created by Nagendra Kumar on 19/12/24.
//

import Foundation
@testable import WeatherApp

class MockWeatherRepository: WeatherRepository {
    var shouldThrowError = false
    
    func getCurrentWeather(city: String) async throws -> WeatherApp.Weather? {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return Weather(id: 2643743, name: "San Francisco", main: Main(temp: 280.32, feelsLike: 278.04, tempMin: 279.15, tempMax: 281.15, humidity: 81), weather: [WeatherData(id: 500, main: "Rain", description: "light rain", icon: "10d")], wind: Wind(speed: 4.1, deg: 80), sys: Sys(country: "GB", sunrise: 1632735260, sunset: 1632778530))
    }
    
    func getForecast(city: String) async throws -> WeatherApp.Forecast? {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return Forecast(
            city: City(name: "London", country: "IN", timezone: 0, sunrise: 1632735260, sunset: 1632778530),
            list: [
                ForecastData(dt: 1672531200, main: Main(temp: 280.32, feelsLike: 278.04, tempMin: 279.15, tempMax: 281.15, humidity: 81), weather: [WeatherData(id: 500, main: "Rain", description: "light rain", icon: "10d")], wind: Wind(speed: 4.1, deg: 80), dtTxt: nil),
                ForecastData(dt: 1672531200, main: Main(temp: 281.32, feelsLike: 277.04, tempMin: 278.15, tempMax: 280.15, humidity: 80), weather: [WeatherData(id: 501, main: "Cloudy", description: "light rain", icon: "10d")], wind: Wind(speed: 4.2, deg: 81), dtTxt: nil),
                ForecastData(dt: 1672531200, main: Main(temp: 282.32, feelsLike: 276.04, tempMin: 277.15, tempMax: 279.15, humidity: 79), weather: [WeatherData(id: 502, main: "Cloudy", description: "light rain", icon: "10d")], wind: Wind(speed: 4.3, deg: 82), dtTxt: nil)
                
            ]
        )
    }
}
