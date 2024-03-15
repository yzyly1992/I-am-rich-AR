//
//  ARViewContainer.swift
//  IAmRich
//
//  Created by David Yang on 2023-06-30.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var tdText: TDText
    
    func makeUIView(context: Context) -> ARView {
        ARVariable.arView = ARView(frame: .zero)
        return ARVariable.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        updateContent(uiView: uiView)
    }
    
    private func updateContent(uiView: ARView) {
        uiView.scene.anchors.removeAll()
        
        let anchor = AnchorEntity(plane: .horizontal)
//        let anchor = AnchorEntity()
        let text = MeshResource.generateText(
            "\(tdText.content)",
            extrusionDepth: 0.12,
            font: .systemFont(ofSize: 0.5, weight: .heavy),
            containerFrame: .zero,
            alignment: .natural,
            lineBreakMode: .byWordWrapping
        )

        let shader = SimpleMaterial(color: tdText.color, roughness: 0.05, isMetallic: true)
        let textEntity = ModelEntity(mesh: text, materials: [shader])

        textEntity.setParent(anchor)
        let leftShift: Float = Float(tdText.content.count / 2) * 0.3
        textEntity.position = SIMD3<Float>(-leftShift, tdText.height, -0.5)
        
        
        // add tap action
        

        uiView.scene.addAnchor(anchor)
        // add gesture to control the text
        textEntity.generateCollisionShapes(recursive: true)
        uiView.installGestures([.scale, .rotation, .translation], for: textEntity)
    }
}
