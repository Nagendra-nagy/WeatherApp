//
//  Constants.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import Foundation

public struct Constants {
    static let baseURL = "BaseAPIURL"
    static let APIKey = "WeatherAPIKey"
    static let kelvinToCelsiusDifference = 273.15
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
}


