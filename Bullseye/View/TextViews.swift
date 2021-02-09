//
//  TextViews.swift
//  Bullseye
//
//  Created by Diana  on 12/26/20.
//

import SwiftUI

struct scoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("Textviews"))
    }
}

struct dateText: View {
    var date: Date
   
    var body: some View {
        Text( date, style: .time)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("Textviews"))
    }
}

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("Textviews"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
        .font(.largeTitle)
        .foregroundColor(Color("Textviews"))
        .fontWeight(.black)
        .kerning(-1)
        .lineSpacing(8.0)
    }
}


struct SliderLabelView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .foregroundColor(Color("Textviews"))
            .frame(width: 35.0)
    }
}

struct textButtonValue: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .padding(20.0)
            .background(
        ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .topLeading, endPoint: .bottomLeading)
        })
            .foregroundColor(.white)
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .font(.title3)
        }
}

struct titleText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("Textviews"))
    }
}

struct bodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .foregroundColor(Color("Textviews"))
            
    }
}

struct buttonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .font(.title3)
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}


struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("Textviews"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            //textButtonValue(text: "Hit me")
            titleText(text: "The slider's value is")
            bodyText(text: "You scored 200 points \n🎉 🎉 🎉")
            scoreText(score: 455)
            dateText(date: Date())
            BigBoldText(text: "Leaderboard")
            
      
        }
        .padding()
    }
}


