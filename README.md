# WeatherApp
An iOS application to show Current Weather and Weekly/Hourly Forecast of any city. 

# Key Features
1. Home Screen: Separate Buttons to navigate to Forecast Screen and Current Weather Screen
2. Forecast Screen: Weather Forecast of next 4 days for a city
3. Current Weather Screen: Current Weather of Pune(Currently using hardcoded value)

# Architecture and Patterns
1. Clean Code Architecture:
   
      a. Domain Layer: Business logic and use cases.
  
      b. Data Layer: Repositories.
  
      c. Presentation Layer: SwiftUI Views and ViewModels(MVVM).
  
      d. Dependency Injection to decouple modules.
  

3. SOLID Principles: Applied to each layer, ensuring single responsibility, dependency inversion, and open/closed principles.

4. Modularization: Separate modules for View, Model, ViewModel, Networking.

5. Concurrency: Swift's modern concurrency with async/await for API calls.

6. UI Framework: SwiftUI for a modern declarative UI.

7. Unit Tests/UI Tests:
   
     a. Unit tests for ViewModels, Models, and Repositories.
   
     b. UI tests for user interaction and navigation.

# API Integration
OpenWeatherMap API Endpoints:

      Current weather: GET /weather?q={city}&appid={API_KEY}

      Hourly/weekly forecast: GET /forecast?q={city}&appid={API_KEY}


# Code Design
MVVM pattern is used for the presentation layer:

      Model: Represents API data (e.g., Weather, Forecast).

      ViewModel: Handles logic and exposes observable states.

      View: Renders UI based on ViewModel's state using SwiftUI.


   
   
