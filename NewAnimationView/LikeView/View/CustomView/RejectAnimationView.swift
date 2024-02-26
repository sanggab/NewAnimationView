//
//  RejectAnimationView.swift
//  NewAnimationView
//
//  Created by Gab on 2024/02/26.
//

import SwiftUI

public struct RejectAnimationView: View {
    @State private var rejectState: Bool = true
    @State private var opacityState: Bool = false
    @State private var size: CGSize = CGSize(width: 100, height: 100)
    
    public var body: some View {
        if rejectState {
            
            BlurEffect(effectStyle: .light, intensity: 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.opacity.animation(.linear(duration: opacityState ? 0.4 : 0.2)))
                .opacity(opacityState ? 1 : 0)
                .onAppear {
                    opacityState = true
                    withAnimation(.spring(response: 0.4)) {
                        size = CGSize(width: 130, height: 130)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        rejectState = false
                        opacityState = false
                    }
                }
            
            Image("imgDisLike")
                .resizable()
                .transition(.opacity.animation(.linear(duration: opacityState ? 0.4 : 0.2)))
                .frame(width: size.width, height: size.height)
        }
    }
}

struct RejectAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        RejectAnimationView()
    }
}
