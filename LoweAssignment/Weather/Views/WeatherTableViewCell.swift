//
//  WeatherTableViewCell.swift
//  LoweAssignment
//
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    var list : List? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI() {
        weatherLabel.text = list?.weather?.first?.main ?? ""
        temperatureLabel.text = "\(list?.main?.temp ?? 0.0)"
    }
    
}
