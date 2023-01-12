//
//  SampleApiService.swift
//  SampleAlamoFire
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//


import Alamofire
import Foundation

struct SampleService {
    public static let shared = SampleService()
    
    func getToken(username : String, password: String,transNumber: String, secretKey: String, success: @escaping (_ result: TokenResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        //Create Signature
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = ["requestType": "getToken", "reqDtime": DateHelper().getCurrentDate(), "transNumber": transactionNumber]
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        let requestBody = ["requestType": "getToken","signature": signatureId, "reqDtime": DateHelper().getCurrentDate(), "transNumber": transactionNumber]
        
        ApiManager.shared.callAPI(serverURL: SampleUrl.baseUrlCobrand,strURL: SampleUrl.Path.getToken, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(TokenResponse.self, from: data)
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
