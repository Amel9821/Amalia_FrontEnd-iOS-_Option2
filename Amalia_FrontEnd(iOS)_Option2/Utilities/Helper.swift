//
//  Helper.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 25/08/23.
//

import Foundation

class My {
    static func queryParams(url:String, params:[String: String]) -> String {
        var sURL = url
        var sParams = ""
        
        for(key, value) in params {
            sParams += key + "=" + value + "&"
        }
        
        if !sParams.isEmpty {
            sParams = "?" + sParams
            
            if sParams.hasSuffix("&") {
                sParams.removeLast()
            }
            
            sURL = sURL + sParams
        }
        
        return sURL
    }
    
    static func newQueryParams(params:[String: String]) -> String {
        // var sURL = url
        var sParams = ""
        
        for(key, value) in params {
            sParams += key + "=" + value + "&"
        }
        
        if !sParams.isEmpty {
            sParams = "?" + sParams
            
            if sParams.hasSuffix("&") {
                sParams.removeLast()
            }
            
            // sURL = sURL + sParams
        }
        
        return sParams
    }
}
