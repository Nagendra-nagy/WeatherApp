import XCTest
@testable import WeatherApp

final class WeatherModelTests: XCTestCase {
    func testWeatherDecoding() throws {
        let jsonData = """
        {
          "id": 2643743,
          "name": "London",
          "main": {
            "temp": 280.32,
            "feels_like": 278.04,
            "temp_min": 279.15,
            "temp_max": 281.15,
            "humidity": 81
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10d"
            }
          ],
          "wind": {
            "speed": 4.1,
            "deg": 80
          },
          "sys": {
            "country": "GB",
            "sunrise": 1632735260,
            "sunset": 1632778530
          }
        }
        """.data(using: .utf8)!

        let weather = try JSONDecoder().decode(Weather.self, from: jsonData)
        XCTAssertEqual(weather.name, "London")
        XCTAssertEqual(weather.main?.temp, 280.32)
        XCTAssertEqual(weather.weather?.first?.main, "Rain")
        XCTAssertEqual(weather.wind?.speed, 4.1)
        XCTAssertEqual(weather.sys?.country, "GB")
    }
}
