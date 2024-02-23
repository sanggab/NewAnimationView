//
//  MainCardView.swift
//  TestAnimation
//
//  Created by Gab on 2024/02/23.
//

import SwiftUI

public struct MainCardView: View {
    @Binding public var parentState: Bool
    @State private var openState: Bool = false
    public let style: LikeSendStyle
    public let contentSize: CGSize
    
    private var boxHeight: CGFloat = 0
    
    @State private var textAnimation: Bool = false
    
    @Namespace private var animation
    
    public init(parentState: Binding<Bool>,
                style: LikeSendStyle,
                contentSize: CGSize) {
        self._parentState = parentState
        self.style = style
        self.contentSize = contentSize
    }
    
    public var body: some View {
        if style.mainCard == .image {
            imgCardView
        } else if style.mainCard == .video {
            videoCardView
        } else {
            textCardView
        }
    }
    
    public func inputBoxHeight(_ height: CGFloat) -> MainCardView {
        var view = self
        view.boxHeight = height
        return view
    }
    
    @ViewBuilder
    public var imgCardView: some View {
        Image(style.thumbnailImgUrl)
            .resizable()
            .overlay {
                if style.state == .delete {
                    ZStack {
                        BlurEffect(effectStyle: .light, intensity: 50)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay {
                                Color.black
                                    .opacity(0.4)
                            }
                            .cornerRadius(12)
                        
                        VStack(spacing: 0) {
                            Image("imgDeletedContent")
                                .resizable()
                                .frame(width: 80, height: 80)

                            Text("Deleted Content")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .padding(.top, 6)
                        }
                    }
                }
            }
            .frame(width: parentState ? contentSize.width - 24 : style.size.width, height: parentState ? contentSize.width - 24 : style.size.height)
            .cornerRadius(12)
            .padding(.horizontal, parentState ? 12 : 0)
            .offset(x: parentState ? 0 : style.point.x, y: parentState ? 124 : style.point.y)
            .onAppear {
                print("style -> \(style)")
                withAnimation(.spring(response: 0.6)) {
                    parentState = true
                }
            }
    }
    
    @ViewBuilder
    public var videoCardView: some View {
        Text("Video")
    }
    
    @ViewBuilder
    public var textCardView: some View {
        ZStack(alignment: .topLeading) {
            let viewSize: CGSize = CGSize(width: contentSize.width - 24, height: contentSize.width - 24)
            let height: CGFloat = style.aboutMeStyle.size.height < 100 ? contentSize.width - 24 - style.aboutMeStyle.size.height : style.aboutMeStyle.size.height
            
            VStack(alignment: .leading, spacing: 0) {
                Text("About me")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.warmgrey)
                    .lineLimit(1)

                Text(style.aboutMe)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.gray20)
                    .padding(.top, parentState ? 16 : 8)
            }
            .frame(width: parentState ? viewSize.width - 32 : style.aboutMeStyle.size.width , height: parentState ? viewSize.height - 35 - (boxHeight / 2) - 6 : height, alignment: .topLeading)
            .offset(x: parentState ? 16 : style.aboutMeStyle.leading, y: parentState ? 36 : style.aboutMeStyle.top)
            .fixedSize()
        }
        .frame(width: parentState ? contentSize.width - 24 : style.size.width, height: parentState ? contentSize.width - 24 : style.size.height, alignment: .topLeading)
        .background(parentState ? .white248 : style.aboutMeStyle.color)
        .cornerRadius(12)
        .onAppear {
            withAnimation(.spring()) {
                parentState = true
            }
//
//            withAnimation(.linear(duration: 0.2)) {
//                parentState = true
//            }
        }
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 0)
        .padding(.horizontal, parentState ? 12 : 0)
        .offset(x: parentState ? 0 : style.point.x, y: parentState ? 124 : style.point.y)
    }
}
