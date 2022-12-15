//
//  ReadLocalJson.swift
//  GooglePlaceReviews
//
//  Created by bwells on 12/15/22.
//

import Foundation

class ReadLocalJSONFile {
    
    func readLocalJSONFile(fileName: String) -> (status: ApiStatus,  data: Any)  {
        do {
            if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return (status: ApiStatus.success,  data: data)
            }
        } catch {
            return (status: ApiStatus.error,  data: "")
        }
        return (status: ApiStatus.error,  data: "")
    }
    
}


