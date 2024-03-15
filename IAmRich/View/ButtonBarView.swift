//
//  ButtonBarView.swift
//  IAmRich
//
//  Created by David Yang on 2023-06-30.
//

import SwiftUI

struct ButtonBarView: View {
    @ObservedObject var tdText : TDText
    @Binding var showInput: Bool
    
    var body: some View {
        HStack {
            Button {
                showInput.toggle()
            } label: {
                showInput ? Image(systemName: "chevron.down").padding(10)
                : Image(systemName: "chevron.up").padding(10)
            }
            .font(.system(size: 20, weight: .bold))
            Spacer()
            Button {
                ARVariable.arView.snapshot(saveToHDR: false) { (image) in
                  
                  let compressedImage = UIImage(data: (image?.pngData())!)
                  UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
                }

            } label: {
                Image(systemName: "camera.aperture")
            }
            .font(.system(size: 48))
            Spacer()
            Button {
                tdText.content = "I Am Rich"
                tdText.height = 0.0
            } label: {
                Image(systemName: "arrow.counterclockwise").padding(10)
            }
            .font(.system(size: 20, weight: .bold))
        }
        .foregroundColor(.init(red: 1.00, green: 0.84, blue: 0.00))
        .opacity(0.70)
        .padding(.horizontal, 24)
    }
}
