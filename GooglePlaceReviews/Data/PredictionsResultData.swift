//
//  Review.swift
//  googleReviews
//
//  Created by bwells on 11/16/22.
//

import Foundation

struct PredictionsResultData: Codable {
    var predictions: [PredictionsData]
}

struct PredictionsData: Codable {
    var description: String
    var place_id: String
}
