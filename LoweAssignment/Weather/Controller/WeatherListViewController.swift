//
//  WeatherListViewController.swift
//  LoweAssignment
//
//

import Foundation
import UIKit

class WeatherListViewController: UIViewController {
    
    @IBOutlet weak var weatherList: UITableView!
    var weatherModel: WeatherModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = weatherModel?.city?.name ?? ""
        registerTableCell()
        weatherList.reloadData()
    }
    
    private func registerTableCell() {
        weatherList.register(WeatherTableViewCell.nib, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        
    }
    
    private func navigateToList(list: List?) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "WeatherDetailViewController") as? WeatherDetailViewController else {
            return
        }
        vc.list = list
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension WeatherListViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.list = weatherModel?.list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToList(list: weatherModel?.list?[indexPath.row])
    }
    
    
}
