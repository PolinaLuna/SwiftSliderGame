
//  PointsView.swift
//  Bullseye
//  Created by Polina on 03.03.2025.

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing:10) {
      InstructionText(text:"The slider vulue is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) Point\n 🎉🎉🎉")
      Button {
        withAnimation{
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start new round")
      }
    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(Constants.General.roundRectCornerRadius)
      .shadow(radius: 10, x: 5, y:5)
    
  }
}

struct PointsView_Preview: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
    
  }
}
