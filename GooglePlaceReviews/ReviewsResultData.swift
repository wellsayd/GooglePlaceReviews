//
//  Review.swift
//  googleReviews
//
//  Created by bwells on 11/16/22.
//

import Foundation

struct ReviewsResultData: Codable {
    var result: ReviewData
}

struct ReviewData: Codable {
    var icon: String
    var reviews: [ReviewsData]
    var rating: Double
    var name:String
    var place_id: String
    var url: String
}

struct ReviewsData: Codable {
    var author_name: String
    var rating: Double
    var relative_time_description: String
    var text: String
    var time: Int
    var profile_photo_url: String
}

