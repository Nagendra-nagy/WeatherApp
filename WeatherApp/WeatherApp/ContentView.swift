//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nagendra Kumar on 16/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack(spacing: 20) {
                        Spacer()
                        Text("Weather App")
                            .font(.largeTitle)
                            .padding()

                        NavigationLink(destination: ForecastView()) {
                            Text("Forecast")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .font(.title)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .accessibilityIdentifier("ForecastButton")
                        }
                        .padding(.horizontal)
                        
                        NavigationLink(destination: WeatherView()) {
                            Text("Current Weather")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .font(.title)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .accessibilityIdentifier("WeatherButton")
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
