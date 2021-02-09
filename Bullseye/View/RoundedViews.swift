//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Diana  on 12/26/20.
//

import SwiftUI


struct roundedTextView: View {
    var text: String
    
    var body: some View {
        HStack{
        Text(text)
            .font(.title)
            .frame( width: Constants.General.roundedRectViewWidth,      height: Constants.General.roundedRectViewHeight )
            .foregroundColor(Color("Textviews"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle()
                        .strokeBorder(Color("LeaderBoardColor"), lineWidth: Constants.General.strokeWidth))
                        
        }
    }
}

struct RoundedImageViewStroked: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("Textviews"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth )
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(Circle()
                            .fill(Color("ButtonFilledBackgroundColor").opacity(1))
            )
    }
}

struct PreviewView: View {
     var body: some View {
        VStack( spacing: 10, content: {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName:"list.dash")
            roundedTextView(text: "1")
        })
    }
}


struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
