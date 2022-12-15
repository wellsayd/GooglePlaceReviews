//
//  StarsView.swift
//  googleReviews
//
//  Created by bwells on 11/30/22.
//

import SwiftUI

struct StarsView: View {
    
    private var wholeNum: Int
    private var remainderNum: Double
    
    init(wholeNum: Double, remainderNum: Double){
        self.wholeNum = Int(wholeNum.rounded(.towardZero))
        self.remainderNum = remainderNum.truncatingRemainder(dividingBy: 1)
    }
    
    var body: some View {
        let hstack = HStack()
        {
            
            ForEach(0..<wholeNum, id: \.self) { i in
                Image("star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0, height: 20.0, alignment: .top)
                    .foregroundColor(.yellow)
            }
            if(remainderNum > 0.75){
                Image("star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0, height: 20.0, alignment: .top)
                    .foregroundColor(.yellow)
            }
            
            if(remainderNum > 0.25 && remainderNum < 0.75) {
                Image("star_half")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0, height: 20.0, alignment: .top)
                    .foregroundColor(.yellow)
            }
            
            
            
        }
        
        return hstack
    }
}

