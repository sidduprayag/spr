//
//  APIRouter.swift
//  LoweAssignment
//
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

// Custom Error object API Calls.
enum APIError: Error {
    case runtimeError(String)
}

// Request parameter types.
enum RequestParams {
    case body(_:Parameters)
}

enum ContentType: String {
    case json = "application/json"
}

/// Builds the URLRequest object.
enum APIRouter: URLRequestConvertible {
    case weatherAPI(city: String,
                    key: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .weatherAPI:
            return .get
        }
    }
    
    // MARK: - url
    private var urlPath: String {
        switch self {
        
        case let .weatherAPI(city: city, key: key):
            return "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(key)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: RequestParams? {
        switch self {
        case .weatherAPI:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        switch self {
        
        case .weatherAPI:
            break
        }
        
        // Parameters
        if let parameters = parameters {
            switch parameters {
            case .body(let params):
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        }
        return urlRequest
    }
}

