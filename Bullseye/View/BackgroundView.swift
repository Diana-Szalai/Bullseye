//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Diana  on 12/26/20.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(1..<6){ ring in
                let size = CGFloat( 100 * ring)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle().stroke(lineWidth: 20.0)
                    .fill( RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity), Color("RingColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/))
                    .frame(width: size, height: size)
            }
        }

    }
    
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View {
      HStack( content: {
        Button(action: { game.restart()}) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
        Spacer()
        Button(action: { leaderboardIsShowing = true }) {
            RoundedImageViewFilled(systemName: "list.dash")
        }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
            LeaderboardView( leaderboardIsShowing: $leaderboardIsShowing, game: $game)
        })
      })
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        
        VStack (spacing: 5){
        labelText(title: title)
        labelRoundandScore(text: text)
       }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
      HStack( content: {
        NumberView(title: "score", text: String(game.score))
           Spacer()
        NumberView(title: "round", text: String(game.round))
      })
      .foregroundColor(.black)
    }
}

struct labelText: View {
    var title: String
    
    var body: some View {
        Text(title.uppercased())
            .bold()
            .foregroundColor(Color("Textviews"))
            .font(.caption)
            .kerning(1.5)
    }
}

struct labelRoundandScore: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame( width: Constants.General.roundedRectViewWidth,      height: Constants.General.roundedRectViewHeight )
            .foregroundColor(Color("Textviews"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius )
                .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth )
        )
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
