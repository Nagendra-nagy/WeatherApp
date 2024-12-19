//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import Foundation

protocol WeatherRepository {
    func getCurrentWeather(city: String) async throws -> Weather?
    func getForecast(city: String) async throws -> Forecast?
}

final class WeatherRepositoryImpl: WeatherRepository {
    private let networkManager = NetworkManager.shared
    private let apiKey: String
    private let baseURL: String
    init() {
        guard let key = Bundle.main.object(forInfoDictionaryKey: Constants.APIKey) as? String, let baseURL = Bundle.main.object(forInfoDictionaryKey: Constants.baseURL) as? String else {
            fatalError("Weather API Key and base URL not found in Info.plist")
        }
        self.apiKey = key
        self.baseURL = baseURL
    }
    
    func getCurrentWeather(city: String) async throws -> Weather? {
        let encodedCity = getEncodedCity(city: city)
        guard let url = URL(string: "\(baseURL)/weather?q=\(encodedCity)&appid=\(apiKey)") else {
            debugPrint("Invalid URL")
            return nil
        }
        return try await networkManager.fetch(url: url, type: Weather.self)
    }

    func getForecast(city: String) async throws -> Forecast? {
        let encodedCity = getEncodedCity(city: city)
        guard let url = URL(string: "\(baseURL)/forecast?q=\(encodedCity)&appid=\(apiKey)") else {
            debugPrint("Invalid URL")
            return nil
        }
        return try await networkManager.fetch(url: url, type: Forecast.self)
    }
    
    func getEncodedCity(city: String)-> String {
        guard let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            debugPrint("Invalid city name")
            return ""
        }
        return encodedCity
    }
}
