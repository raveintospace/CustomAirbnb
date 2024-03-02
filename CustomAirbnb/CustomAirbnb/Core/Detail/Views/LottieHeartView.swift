//
//  LottieHeartView.swift
//  CustomAirbnb
//
//  Created by Uri on 2/3/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    let contentMode: UIView.ContentMode
    
    let animationView: LottieAnimationView
    
    init(name: String,
         loopMode: LottieLoopMode,
         animationSpeed: CGFloat,
         contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed
        self.contentMode = contentMode
        self.animationView = LottieAnimationView(name: name)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)             // lets us customize our frame
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.contentMode = contentMode
        animationView.play()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
