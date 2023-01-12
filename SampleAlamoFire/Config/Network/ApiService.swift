//
//  ApiService.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 07/01/23.
//

import Alamofire
import Foundation

struct ApiService {
    public static let shared = ApiService()
    
    func callCreateLogin(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: LoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        ApiManager.shared.callAPI(strURL: SampleUrl.Path.login, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }

    func getUser(success: @escaping (_ result: UserResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        ApiManager.shared.callAPI(strURL: SampleUrl.Path.getSingleUser, method: .get, headers: headers,success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(UserResponse.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    func getListUser(success: @escaping (_ result: UserListResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        ApiManager.shared.callAPI(strURL: SampleUrl.Path.getListUser, method: .get, headers: headers,success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(UserListResponse.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
