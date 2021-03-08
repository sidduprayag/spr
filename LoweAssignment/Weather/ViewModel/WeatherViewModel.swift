//
//  WeatherViewModel.swift
//  LoweAssignment
//
//

import Foundation
import Combine

let key = "65d00499677e59496ca2f318eb68c049"

class WeatherViewModel {

    @Published var weatherModel: WeatherModel? = nil
    @Published var errorMessage: String? = nil

    func makeWeatherRequest(cityName: String) {
        APIClient.weatherAPI(city: cityName, key: key) {[weak self] response in
            switch response {
            case .success(let model):
                self?.weatherModel = model
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
