//
//  SuggestView.swift
//  test
//
//  Created by bwells on 12/14/22.
//

import SwiftUI

struct SuggestView: View {

    @State var suggestions = [""]
    @State var predictions:PredictionsResultData!
    let suggestViewModel = SuggestViewModel()
    @State var isPresented = false
    @State public var reviewsResultData: ReviewsResultData?
    @State var input: String = ""
    @State private var showingAlert = false

    var body: some View {

        VStack {
            TextField("Type in a local Google place, like McDonalds, etc", text: $input)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onChange(of: input) { text in
                    Task {
                        if let data = await suggestViewModel.getData(searchFor: text) {
                            suggestions = []
                            predictions = data
                            for prediction in data.predictions {
                                suggestions.append(prediction.description)
                            }
                        }
                    }
                 }

        }
        List(suggestions, id: \.self) { suggestion in
            ZStack {
                Button(suggestion, action: {
                    
                    if(suggestions == [""]) {
                        return
                    }
                    
                    if let i = suggestions.firstIndex(where: { $0.description == suggestion }) {
                        Task {
                            
                            if let reviewData = await suggestViewModel.getGoogleReviews(placeId: predictions.predictions[i].place_id) {
                                reviewsResultData = reviewData
                                isPresented.toggle()
                            } else {
                                showingAlert.toggle()
                            }
                        }
                    }
                })
                

            }

            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .sheet(isPresented: $isPresented) {
                ReviewsView(isPresented: $isPresented, results: $reviewsResultData)
        }
        
        .alert("No reviews have been submitted for this Google Place. \n\n Be more specific. \n\n Try a business such as McDonalds.", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    
}


