//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Nagendra Kumar on 16/12/24.
//

import XCTest

final class WeatherAppUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testContentViewDisplaysButtons() {
        // Assert that ContentView buttons exist
        let weatherButton = app.buttons["Current Weather"]
        let forecastButton = app.buttons["Forecast"]

        XCTAssertTrue(weatherButton.exists, "Weather button should be present on ContentView")
        XCTAssertTrue(forecastButton.exists, "Forecast button should be present on ContentView")
    }

    func testNavigateToWeatherView() {
        // Tap the Weather button
        app.buttons["Current Weather"].tap()

        // Verify that WeatherView is displayed
        let weatherTitle = app.navigationBars["Current Weather"]
        XCTAssertTrue(weatherTitle.exists, "WeatherView should be displayed after tapping Weather button")

        // Wait for weather data to load
        let cityText = app.staticTexts["City: London"]
        let exists = cityText.waitForExistence(timeout: 5)

        XCTAssertTrue(exists, "Weather data should be displayed on WeatherView")
    }

    func testNavigateToForecastView() {
        // Tap the Forecast button
        app.buttons["Forecast"].tap()

        // Verify that ForecastView is displayed
        let forecastTitle = app.navigationBars["Forecast"]
        XCTAssertTrue(forecastTitle.exists, "ForecastView should be displayed after tapping Forecast button")

        // Tap the Fetch Forecast button
        app.buttons["Fetch Forecast"].tap()
        
        // Wait for forecast data to load
        let temperature = app.staticTexts["TemperatureText"]
        let temperatureExists = temperature.waitForExistence(timeout: 5)
        XCTAssertTrue(temperatureExists, "temperature data should be displayed on ForecastView")
        
        let date = app.staticTexts["DateText"]
        let dateExists = date.waitForExistence(timeout: 5)
        XCTAssertTrue(dateExists, "date data should be displayed on ForecastView")
        
        let weather = app.staticTexts["WeatherText"]
        let weatherExists = weather.waitForExistence(timeout: 5)
        XCTAssertTrue(weatherExists, "weather data should be displayed on ForecastView")
        
        let windSpeed = app.staticTexts["WindSpeedText"]
        let windSpeedExists = windSpeed.waitForExistence(timeout: 5)
        XCTAssertTrue(windSpeedExists, "windSpeed data should be displayed on ForecastView")
    }
}
