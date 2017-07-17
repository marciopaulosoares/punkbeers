//
//  Rest.swift
//  PUNKBeers
//
//  Created by marcio paulo on 7/16/17.
//  Copyright © 2017 marcio paulo. All rights reserved.
//

import Foundation

class Rest{
    static let basePath = "https://api.punkapi.com/v2/beers";
    
    static let configuration: URLSessionConfiguration={
        let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-type" :"application/json"]
        config.timeoutIntervalForRequest=45.0
        config.httpMaximumConnectionsPerHost = 5
        
        return config;
    
    }()
    
    static let session = URLSession(configuration: configuration)

}
