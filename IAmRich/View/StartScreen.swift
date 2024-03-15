//
//  StartScreen.swift
//  IAmRich
//
//  Created by David Yang on 2023-07-02.
//

import SwiftUI

struct StartScreen: View {
    @Binding var arActive: Bool
    var body: some View {
        ZStack{
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height - 100, alignment: .center)
                .cornerRadius(30)
            VStack(alignment: .center, spacing: 30) {
                Text("I Am Rich")
                    .font(.system(size: 48, weight: .heavy))
                    .multilineTextAlignment(.center)
                    
                
                Image(systemName: "trapezoid.and.line.horizontal")
                    .font(.system(size: 56.0))
                      
                Text("Rotate your camera to detect a flat surface.")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                
                Image(systemName: "hand.draw.fill")
                    .font(.system(size: 56.0))
                
                Text("Drag AR object to move.\nTwo fingers to rotate and scale.")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                Button("OK") {
                    arActive.toggle()
                }
                .font(.system(size: 32))
                .padding(.all, 30)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 5)
                )
            }
            .padding(.all, 25)
            .foregroundColor(.black)
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(arActive: .constant(false))
            .previewDevice("iPhone SE (3rd generation)")
    }
}
