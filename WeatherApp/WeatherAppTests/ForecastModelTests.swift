import XCTest
@testable import WeatherApp

final class ForecastModelTests: XCTestCase {
    func testForecastDecoding() throws {
        let jsonData = """
        {
          "city": {
            "name": "London",
            "country": "GB",
            "timezone": 0,
            "sunrise": 1632735260,
            "sunset": 1632778530
          },
          "list": [
            {
              "dt": 1632772800,
              "main": {
                "temp": 282.55,
                "feels_like": 280.65,
                "temp_min": 282.55,
                "temp_max": 282.55,
                "humidity": 76
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01d"
                }
              ],
              "wind": {
                "speed": 4.12,
                "deg": 240
              },
              "dt_txt": "2024-12-14 12:00:00"
            }
          ]
        }
        """.data(using: .utf8)!

        let forecast = try JSONDecoder().decode(Forecast.self, from: jsonData)
        XCTAssertEqual(forecast.city?.name, "London")
        XCTAssertEqual(forecast.list?.count, 1)
        XCTAssertEqual(forecast.list?.first?.main?.temp, 282.55)
        XCTAssertEqual(forecast.list?.first?.weather?.first?.description, "clear sky")
    }
}
