//
//  InputBarView.swift
//  IAmRich
//
//  Created by David Yang on 2023-07-06.
//

import SwiftUI

struct InputBarView: View {
    @State var inputText : String = ""
    @ObservedObject var tdText : TDText
    
    var body: some View {
        
        HStack {
            
            TextField("Type something here...", text: $inputText)
            //.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white.opacity(0.4).cornerRadius(10))
                .foregroundColor(.black)
                .font(.headline)
            
            Button(action: {
                if inputText != "" && inputText.count <= 25 {
                    tdText.content = inputText
                    inputText = ""
                    dismissKeyboard()
                }
            }) {
                Text("OK")
                    .padding()
                    .background(Color.init(red: 1.00, green: 0.84, blue: 0.00, opacity: 0.7).cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .padding()
    }
    
    func dismissKeyboard() {
      UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
    }
}

struct InputBarView_Previews: PreviewProvider {
    static var previews: some View {
        InputBarView(tdText: TDText())
    }
}
