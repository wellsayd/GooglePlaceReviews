//
//  SuggestViewModel.swift
//  test
//
//  Created by bwells on 12/14/22.
//

import Foundation

internal class SuggestViewModel {
    
    private let apiCall = ApiCall()
    private let googleApiKey = ""
    
    func getData(searchFor: String) async -> PredictionsResultData? {
        
        var data: (status: ApiStatus,  data: Any)
        
        if(googleApiKey != "") {
            let apiCall = ApiCall()
            data = await apiCall.makeCall("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=" + searchFor + "&key=" + googleApiKey)
        } else {
            data = readLocalJSONFile(fileName: "./GooglePredictionsData")
        }

        if(data.status == .success) {
            do {
                let json = try JSONDecoder().decode(PredictionsResultData.self, from: data.data as! Data)
                return json
            } catch {
                return (nil)
            }
                      
        }
        return (nil)
        
        
      
    }
    
    func getGoogleReviews(placeId: String) async -> ReviewsResultData? {
        
        var data: (status: ApiStatus,  data: Any)
        
        if(googleApiKey != "") {
            let apiCall = ApiCall()
            data = await apiCall.makeCall("https://maps.googleapis.com/maps/api/place/details/json?place_id=" + placeId + "&key=" + googleApiKey)

        } else {
            data = readLocalJSONFile(fileName: "./GoogleReviewsData")
        }

        if(data.status == .success) {
            do {
                let json = try JSONDecoder().decode(ReviewsResultData.self, from: data.data as! Data)
                return  (json)
            } catch {
                return (nil)
            }
                      
        }
        return (nil)
    }
    
    private func readLocalJSONFile(fileName: String) -> (status: ApiStatus,  data: Any)  {
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
