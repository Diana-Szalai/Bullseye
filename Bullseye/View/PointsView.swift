//
//  PointsView.swift
//  Bullseye
//
//  Created by Diana  on 12/28/20.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        
        VStack(spacing: 10){
            titleText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            bodyText(text: "You scored \(points) points \n🎉 🎉 🎉")
            Button(action: { withAnimation {
                alertIsVisible = false }
                game.startNewRound(points: points)
            }) {
                buttonText(text: "Start new round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5 )
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
//    static var alertIsVisible = Binding.constant(false)
//    static var sliderValue = Binding.constant(50.0)
 //   static var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView( alertIsVisible: Binding.constant(false), sliderValue: Binding.constant(50.0), game: Binding.constant(Game()))
        PointsView( alertIsVisible: Binding.constant(false), sliderValue: Binding.constant(50.0), game: Binding.constant(Game()))
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView( alertIsVisible: Binding.constant(false), sliderValue: Binding.constant(50.0), game: Binding.constant(Game()))
            .preferredColorScheme(.dark)
        PointsView( alertIsVisible: Binding.constant(false), sliderValue: Binding.constant(50.0), game: Binding.constant(Game()))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
        
    }
}
