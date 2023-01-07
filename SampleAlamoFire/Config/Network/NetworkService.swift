//
//  NetworkService.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Foundation
import Alamofire

let BASE_URL = "https://reqres.in/"
class NetworkService : NSObject{
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String = BASE_URL
    var encoding: ParameterEncoding! = JSONEncoding.default
 
    init(data: [String:Any],headers: [String:String] = [:],apiPath :ApiPath? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if apiPath != nil{
            self.url += apiPath!.rawValue
        }
        
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print("Service: \(apiPath?.rawValue ?? self.url) \n data: \(parameters)")
    }
    
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                print("Response : \(response)")
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            print("Response : \(res)")
                            print("Response : \(String(describing: response.data))")
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

/**
 *check connectivity
*/
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
