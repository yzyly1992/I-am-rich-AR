//
//  ContentView.swift
//  IAmRich
//
//  Created by David Yang on 2023-06-30.
//

import SwiftUI
import RealityKit

struct ARVariable {
    static var arView: ARView!
}

struct ContentView : View {
    
    @StateObject private var tdText = TDText()
    @State var arActive = false
    @State var showInput = false
    
    var body: some View {
        ZStack() {
            ARViewContainer(tdText: tdText)
            if arActive {
                VStack {
                    Spacer()
//                    if showInput {
//                        HStack {
//                            Slider(value: $tdText.height, in: -1...1)
//                                .accentColor(.init(red: 1.00, green: 0.84, blue: 0.00))
//                                .frame(width: 100.0)
//                                .rotationEffect(.degrees(-90.0), anchor: .topLeading)
//                                .padding(.horizontal, 30)
//                            Spacer()
//                        }
//                    }
                    ButtonBarView(tdText: tdText, showInput: self.$showInput)
                    if showInput {
                        InputBarView(tdText: tdText)
                    }
                }
                .padding(.bottom, 25)
                .adaptsToKeyboard()

            } else {
                StartScreen(arActive: self.$arActive)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
