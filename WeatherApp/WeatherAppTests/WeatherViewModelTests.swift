//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Nagendra Kumar on 19/12/24.
//

import XCTest
@testable import WeatherApp

@MainActor
final class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
    var mockRepository: MockWeatherRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockWeatherRepository()
        viewModel = WeatherViewModel(weatherRepository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testFetchWeatherSuccess() async {
        // Arrange
        mockRepository.shouldThrowError = false

        // Act
        await viewModel.fetchWeather(for: "San Francisco")

        // Assert
        XCTAssertNotNil(viewModel.weather, "Weather should not be nil on success")
        XCTAssertEqual(viewModel.weather?.name, "San Francisco", "City name should match")
        XCTAssertEqual(viewModel.formatTemperature(temp: viewModel.weather?.main?.temp ?? 0), 7, "Temperature should be correctly converted")
        XCTAssertNil(viewModel.errorString, "Error string should be nil on success")
    }

    func testFetchWeatherFailure() async {
        // Arrange
        mockRepository.shouldThrowError = true

        // Act
        await viewModel.fetchWeather(for: "InvalidCity")

        // Assert
        XCTAssertNil(viewModel.weather, "Weather should be nil on failure")
        XCTAssertNotNil(viewModel.errorString, "Error string should not be nil on failure")
        XCTAssertEqual(viewModel.errorString, URLError(.badServerResponse).localizedDescription, "Error message should match expected value")
    }

    func testFetchForecastSuccess() async {
        // Arrange
        mockRepository.shouldThrowError = false

        // Act
        await viewModel.fetchForecast(for: "San Francisco")

        // Assert
        XCTAssertNotNil(viewModel.forecast, "Forecast should not be nil on success")
        XCTAssertEqual(viewModel.forecast?.city?.name, "London", "City name in forecast should match")
        XCTAssertEqual(viewModel.forecast?.list?.count, 3, "Forecast list count should match expected value")
        XCTAssertNil(viewModel.errorString, "Error string should be nil on success")
    }

    func testFetchForecastFailure() async {
        // Arrange
        mockRepository.shouldThrowError = true

        // Act
        await viewModel.fetchForecast(for: "InvalidCity")

        // Assert
        XCTAssertNil(viewModel.forecast, "Forecast should be nil on failure")
        XCTAssertNotNil(viewModel.errorString, "Error string should not be nil on failure")
        XCTAssertEqual(viewModel.errorString, URLError(.badServerResponse).localizedDescription, "Error message should match expected value")
    }

    func testFormatDate() {
        // Arrange
        let timestamp: TimeInterval = 1672531200 // Jan 1, 2023
        let expectedDate = "1/1/23"

        // Act
        let formattedDate = viewModel.formatDate(forecastDate: timestamp)

        // Assert
        XCTAssertEqual(formattedDate, expectedDate, "Formatted date should match expected value")
    }

    func testFormatTemperature() {
        // Arrange
        let kelvinTemp: Double = 293.15
        let expectedCelsius = 20

        // Act
        let celsiusTemp = viewModel.formatTemperature(temp: kelvinTemp)

        // Assert
        XCTAssertEqual(celsiusTemp, expectedCelsius, "Converted temperature should match expected value")
    }
}
