//
//  API.swift
//
//
//  Created by NiM on 6/26/2560 BE.
//  Copyright © 2560 All rights reserved.
//

import Foundation
import Alamofire

let TIMEOUT:TimeInterval = 180.0;

class Log {
    class func d(_ items:Any) {
        #if DEBUG
            print(items)
        #endif
    }
}

typealias APIResponseHandler = ((APIResponse) -> Void)

class API : URLConvertible {
    
    let BASE_URL = "https://scb-test-mobile.herokuapp.com";

    open var urlString:String {
        return ""
    }
    
    open var parameters:Parameters?

    func asURL() throws -> URL {
        return URL(string: urlString)!
    }
    
    func responseClass() -> AnyClass {
        return APIResponse.self;
    }
    
    func urlRequest(method: HTTPMethod = .get, encoding:ParameterEncoding = URLEncoding.queryString) -> DataRequest? {
        let parameters = self.parameters
        
        Log.d("Request... \(urlString)")
        Log.d("Param \(parameters ?? [:])\n")
        
        return Alamofire.request(self, method: method, parameters: parameters, encoding: encoding)
    }

    func requestWithHandler(handler : @escaping APIResponseHandler) {
        if let request = self.urlRequest() {
            request.responseData(completionHandler: { (data) in
                self.handleResponse(response: data, handler: handler)
            })
        }
    }
    
    func requestWithJSONHandler(handler : @escaping APIResponseHandler) {
        if let request = self.urlRequest() {
            request.responseJSON(completionHandler: { (data) in
                self.handleResponse(response: data, handler: handler)
            })
        }
    }

    func handleResponse<T>(response:DataResponse<T>, handler:APIResponseHandler) {
        if let className = self.responseClass() as? APIResponse.Type {
            let responseObj = className.init()
            
            if let error = response.result.error {
                responseObj.error = error;
            } else {
                if let JSON = response.result.value as? Data {
                    responseObj.createModel(with: JSON)
                } else {
                    responseObj.createJSONModel(with: response.result.value as Any)
                }
            }
            
            handler(responseObj)
        }
    }
}

class APIResponse {
    
    var data:Any?
    var error:Error?
    
    required init() {

    }
    
    func createModel(with data:Data) {
        self.data = data
    }

    func createJSONModel(with json:Any) {
        self.data = json
    }
}


