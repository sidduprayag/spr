//
//  WeatherDetailViewController.swift
//  LoweAssignment
//
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!

    var list: List?


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }

    private func updateUI(){
        guard let  list = list else {
            return
        }
        weatherLabel.text = list.weather?.first?.main ?? ""
        weatherDescLabel.text = list.weather?.first?.weatherDescription ?? ""
        temperatureLabel.text = "\(list.main?.temp ?? 0.0)"
        feelsLikeLabel.text = "Feels like \(list.main?.feelsLike ?? 0.0)"

    }
    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
