//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Diana  on 12/29/20.
//

import SwiftUI

struct LeaderboardView: View {

    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
            ScrollView{
                VStack(spacing: 10) {
                    ForEach(game.leaderBoardEntries.indices){ i in
                        let leaderBoardEntry = game.leaderBoardEntries[i]
                    RowView(index: i, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct  RowView: View {
    let index: Int
    let score: Int
    let date: Date
    //@Binding var game: Game
    
    var body: some View {
        HStack {
            roundedTextView(text: String(index))
            Spacer()
            scoreText(score: score).frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            dateText(date: date).frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(RoundedRectangle(cornerRadius: .infinity)
                        .strokeBorder( Color("LeaderBoardColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
    
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }else {
                    BigBoldText(text: "Leaderboard")
                }
            }.padding(.top)
            HStack{
                Spacer()
                Button(action: { leaderboardIsShowing = false }) {
                    RoundedImageViewFilled(systemName:"xmark")
                        .padding(.trailing)
                }
            }
           
        }
        
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            labelText(title: "Score")
            .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            labelText(title: "Date")
            .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
    
}

struct LeaderboardView_Previews: PreviewProvider {
   
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
            
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
                .preferredColorScheme(.dark)
            LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
    
    }

}
