//
//  APIManager.swift
//  CS_iOS_Assignment
//
//  Created by Infaz Ariff on 5/29/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation
import Alamofire

public class APIManager {
    
    static let networkEnviroment: NetworkEnvironment = .dev
    
    //MARK: - Properities
    public class var sharedInstance: APIManager {
        struct Singleton {
            static let instance : APIManager = APIManager()
        }
        return Singleton.instance
    }
    
    /**
     * Common API call
     */
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, AlertMessage>) -> Void) where T: Codable {
        
        if isConnectedToInternet() == true {
            AF.request(type.url, method: type.httpMethod, parameters: params, encoding: type.encoding, headers: type.headers, interceptor: nil).validate().responseJSON { (data) in
                do {
                    guard let jsonData = data.data else {
                        throw AlertMessage(title: "Error", body: "No data")
                    }
                    do {
                        let data1 =  try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:AnyObject]  // first of all convert json to the data
                        print(data1 ?? "defaultvalue")
                    } catch let myJSONError {
                        print(myJSONError)
                    }
                    
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    handler(.success(result))
                } catch {
                    if let error = error as? AlertMessage {
                        return handler(.failure(error))
                    }
                    
                    handler(.failure(self.parseApiError(data: data.data)))
                }
            }
        }else{
            print("Internet not available")
        }
    }

    /**
    * Check network available or not
    */
    private func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /**
    * Error messages handler
    */
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(ErrorModel.self, from: jsonData) {
            return AlertMessage(title: AlertTitle.defaultAlertTitle, body: error.message ?? "Error")
        }
        return AlertMessage(title: AlertTitle.defaultAlertTitle, body: AlertBody.genericErrorMessage)
    }
}
