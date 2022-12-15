//
//  GoogleReviews.swift
//  googleReviews
//
//  Created by bwells on 11/21/22.
//

import SwiftUI

struct GoogleReviews: View {

    var reviewData: ReviewsResultData
    var wholeNum: Double
    var rating: Double
    var remainderNum: Double
    @State public var results: ReviewsResultData!
    @State var isPresented = false
    
    init(reviewData: ReviewsResultData){
        self.reviewData = reviewData
        self.wholeNum = self.reviewData.result.rating
        self.rating = self.reviewData.result.rating
        self.remainderNum = self.reviewData.result.rating.truncatingRemainder(dividingBy: 1)
        results = self.reviewData
    }
    
    var body: some View {
        let hstack = HStack()
            {
                if(rating > 0){
                    
                    Text(String(rating))
                    StarsView(wholeNum: self.wholeNum, remainderNum: self.remainderNum)

                } else {
                    Text("No rating")
                }
                
                if(self.reviewData.result.reviews.count > 0) {
                    if(rating > 0) {
                        Text(" / ")
                    }
                    
                    Button("See Reviews", action: { self.isPresented.toggle() })
                        .sheet(isPresented: $isPresented) {
                                ReviewsView(isPresented: $isPresented, results: $results)
                        }
                }
            }
        
        return hstack
        
    }
}




