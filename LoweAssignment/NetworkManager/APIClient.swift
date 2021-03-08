//
//  APIClient.swift
//  LoweAssignment
//
//

import Foundation
import Alamofire

class  APIClient {
    @discardableResult
    private static func requestData<T: Decodable>(route: APIRouter,
                                                  decoder: JSONDecoder = JSONDecoder(),
                                                  completion:@escaping (Swift.Result < T,
                                                                                       APIError>)
                                                    -> Void) -> DataRequest {
        return AF.request(route).responseData { response in
            switch response.result {
            case .success(let response):
                do {
                    let obj = try decoder.decode(T.self, from: response)
                    completion(.success(obj))
                } catch {
                    completion(.failure(APIError.runtimeError("decodingError")))
                }
                
            case .failure(let error):
                completion(.failure(APIError.runtimeError(error.localizedDescription)))
            }
        }
        
    }
    
    
    static func weatherAPI(city: String,
                           key: String,
                           completion:@escaping (Swift.Result<WeatherModel, APIError>) -> Void) {
        requestData(route: APIRouter.weatherAPI(city: city,
                                                key: key),
                    completion: completion)
    }
}
