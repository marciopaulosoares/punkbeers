//
//  BeerRepository.swift
//  PUNKBeers
//
//  Created by marcio paulo on 7/16/17.
//  Copyright © 2017 marcio paulo. All rights reserved.
//

import Foundation
import UIKit

class BeerRepository{
    
    
    static func DownloadImage(url:String, onComplete : @escaping (UIImage?) -> Void ){
        guard let url = URL(string: url) else {
            onComplete(nil)
            return
        }
        Rest.session.downloadTask(with: url, completionHandler:{(url:URL?, response: URLResponse?, erro:Error?) in
        
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let url = url{
            
                let imageData = try! Data(contentsOf: url)
                let image = UIImage(data: imageData)
                onComplete(image)
            }else{
                onComplete(nil)
            }
        
        }).resume()
        
        
    }
    
    static func getAll(onComplete: @escaping([Beer]?) -> Void){
        guard let url = URL(string:Rest.basePath) else{
            onComplete(nil);
            return
        }
        
        Rest.session.dataTask(with: url){
            (data: Data?, response:URLResponse?, error:Error?) in
            if (error != nil){
                onComplete(nil)
            }
            else{
                guard let response = response as? HTTPURLResponse else{
                    onComplete(nil)
                    return
                }
                if( response.statusCode == 200){
                
                    guard let data = data else{
                            onComplete(nil)
                            return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String:Any]]
                    
                    var beers:[Beer] = []
                    
                    for item in json{
                        let name = item["name"] as! String
                        let tagline = item["tagline"] as! String
                        let description = item["description"] as! String
                        let abv = item["abv"] as! Float
                        
                        var ibuFormat:String = "--"
                        if let ibu = item["ibu"] {
                            ibuFormat="\(ibu)"
                        }
                        
                        var image:String = "beer-icon.png"
                        if let image_url = item["image_url"] {
                            image = "\(image_url)"
                        
                        }
                        
                        let beer = Beer(image: image, name: name, abv: "\(abv)", ibu: ibuFormat, tagLine: tagline, description: description)
                        
                        beers.append(beer)
                        onComplete(beers)

                    
                    }
                    
                    
                    
                }else{
                    onComplete(nil)
                }
            }
        }.resume()
    }
}
