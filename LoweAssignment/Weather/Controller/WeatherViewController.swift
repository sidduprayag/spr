//
//  WeatherViewController.swift
//  LoweAssignment
//
//

import UIKit
import Combine

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!

    var viewModel = WeatherViewModel()
    private var bag = Set<AnyCancellable>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        // Do any additional setup after loading the view.
    }

    private func bindViewModel() {
        viewModel.$weatherModel.sink { [weak self] weatherModel in
            guard let model = weatherModel else { return }
            self?.navigateToList(weatherModel: model)
        }
        .store(in: &bag)

        viewModel.$errorMessage.sink { [weak self] errorMessage in
            guard let errorMessage =  errorMessage else { return }
            self?.showAlert(title: "Alert", message: errorMessage)

        }
        .store(in: &bag)
    }

    private func navigateToList(weatherModel: WeatherModel) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "WeatherListViewController") as? WeatherListViewController else {
            return
        }
        vc.weatherModel = weatherModel
        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func lookUpButtonTapped(_ sender: UIButton) {
        guard  let text = cityNameTextField.text else { return }
        viewModel.makeWeatherRequest(cityName: text)
    }
}

extension WeatherViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

