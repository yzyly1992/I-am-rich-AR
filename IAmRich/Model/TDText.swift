//
//  3DText.swift
//  IAmRich
//
//  Created by David Yang on 2023-06-30.
//
import SwiftUI

class TDText: ObservableObject {
    @Published var content = "I Am Rich"
    @Published var height: Float = 0.00
    @Published var color = UIColor(red: 1.00, green: 0.84, blue: 0.00, alpha: 1.00)
}
