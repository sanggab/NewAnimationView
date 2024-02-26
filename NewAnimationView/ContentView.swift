//
//  ContentView.swift
//  NewAnimationView
//
//  Created by Gab on 2024/02/23.
//

import SwiftUI

public struct ContentView: View {
    @State private var shouldAnimate = false
    @State private var imageOrigin: CGPoint = .zero
    @State private var imageOrigin2: CGPoint = .zero
    @State private var textOrigin: CGPoint = .zero
    @State private var textOrigin2: CGPoint = .zero
    @State private var size: CGSize = .zero
    @State private var size2: CGSize = .zero
    @State private var textSize: CGSize = .zero
    @State private var textSize2: CGSize = .zero
    @State private var aboutMeSize: CGSize = .zero
    @State private var aboutMeSize2: CGSize = .zero
    @State private var scrollviewSize: CGSize = .zero
    
    @State private var goSize: CGSize = .zero
    @State private var goOrigin: CGPoint = .zero
    
    @State private var style: LikeSendStyle = .zero
        
    public var body: some View {
        ScrollView {
            GeometryReader { proxy in
                VStack(alignment: .leading, spacing: 0) {
                    Image("도화가23")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .topLeading)
                        .onTapGesture {
                            let test = proxy.frame(in: .named("스크롤")).origin
                            let newOrigin = CGPoint(x: imageOrigin.x + test.x, y: imageOrigin.y + test.y)
                            
                            style = LikeSendStyle(state: .delete,
                                                  type: .Like,
                                                  mainCard: .image,
                                                  thumbnailImgUrl: "도화가23",
                                                  ptrName: "심상갑",
                                                  point: newOrigin,
                                                  size: size)
                            shouldAnimate = true
                        }
                        .opacity(shouldAnimate ? 0 : 1)
                        .cornerRadius(12)
                        .background {
                            GeometryReader { imageProxy in
                                Color.clear
                                    .onAppear {
                                        let scrollData  = imageProxy.frame(in: .named("스크롤"))
                                        imageOrigin = scrollData.origin
                                        size = scrollData.size
                                    }
                            }
                        }
                        .padding(.top, 12)
                        .padding(.leading, 12)
                    
                    Spacer()
                        .frame(height: 500)
                    
                    ZStack(alignment: .topLeading) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Liked your \"about me\"")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.commentText)
                            
                            Text("I work as a model in Spain and I'm bored because I don't have any friends here.  love tennis, football, hockey, and all kinds of sports ! I work as a model in Spain and I'm boredad")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.gray50)
                                .lineLimit(2)
                                .lineSpacing(8)
                                .padding(.top, 6)
                        }
                        .background {
                            GeometryReader { aboutMeProxy in
                                Color.clear
                                    .onAppear {
                                        let scrollData = aboutMeProxy.frame(in: .local)
                                        aboutMeSize2 = scrollData.size
                                        print("aboutMeSize2 -> \(aboutMeSize2)")
                                    }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .frame(height: 96, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        let test = proxy.frame(in: .named("스크롤")).origin
                        let newOrigin = CGPoint(x: textOrigin.x + test.x, y: textOrigin.y + test.y)
                        style = LikeSendStyle(state: .original,
                                              type: .match,
                                              mainCard: .text,
                                              comment: "Liked your \"about me\"",
                                              aboutMe: "I work as a model in Spain and I'm bored because I don't have any friends here.  love tennis, football, hockey, and all kinds of sports ! I work as a model in Spain and I'm boredad",
                                              ptrName: "심상갑",
                                              point: newOrigin,
                                              size: textSize,
                                              aboutMeStyle: LikeAboutMeStyle(top: 12, leading: 12, trailing: 12, bottom: 12, size: aboutMeSize2, color: .primary300))

                        shouldAnimate = true
                    }
                    .background(.primary300)
                    .cornerRadius(12)
//                    .opacity(shouldAnimate ? 0 : 1)
                    .background {
                        GeometryReader { textProxy in
                            Color.clear
                                .onAppear {
                                    let scrollData = textProxy.frame(in: .named("스크롤"))
                                    textOrigin = scrollData.origin
                                    textSize = scrollData.size
                                }
                        }
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, 12)
                    
                    ZStack(alignment: .topLeading) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 0) {
                                Text("About me")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.warmgrey)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                Text("번역하기")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.warmgrey)
                                    .lineLimit(1)
                            }
                            
                            Text("I work as a model in Spain and I'm bored because I don't have any friends here.  love tennis, football, hockey, and all kinds of sports ! I work as a model in Spain and I'm boredad")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.gray20)
                                .padding(.top, 8)
                        }
                        .background {
                            GeometryReader { aboutMeProxy in
                                Color.clear
                                    .onAppear {
                                        let scrollData = aboutMeProxy.frame(in: .local)
                                        aboutMeSize = scrollData.size
                                    }
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .onTapGesture {
                        let test = proxy.frame(in: .named("스크롤")).origin
                        let newOrigin = CGPoint(x: textOrigin2.x + test.x, y: textOrigin2.y + test.y)
                        style = LikeSendStyle(state: .delete,
                                              type: .match,
                                              mainCard: .text,
                                              comment: "Liked your \"about me\"",
                                              aboutMe: "I work as a model in Spain and I'm bored because I don't have any friends here.  love tennis, football, hockey, and all kinds of sports ! I work as a model in Spain and I'm boredad",
                                              ptrName: "심상갑",
                                              point: newOrigin,
                                              size: textSize2,
                                              aboutMeStyle: LikeAboutMeStyle(top: 12, leading: 12, trailing: 12, bottom: 16, size: aboutMeSize, color: .white))

                        shouldAnimate = true
                    }
                    .background(.white)
                    .cornerRadius(12)
                    .opacity(shouldAnimate ? 0 : 1)
                    .background {
                        GeometryReader { textProxy in
                            Color.clear
                                .onAppear {
                                    let scrollData = textProxy.frame(in: .named("스크롤"))
                                    textOrigin2 = scrollData.origin
                                    textSize2 = scrollData.size
                                }
                        }
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, 12)
                    
                    
                    Spacer()
                        .frame(height: 500)
                    
                    
                    Image("도화가23")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .topLeading)
                        .onTapGesture {
                            let test = proxy.frame(in: .named("스크롤")).origin
                            let newOrigin = CGPoint(x: imageOrigin2.x + test.x, y: imageOrigin2.y + test.y)
                            style = LikeSendStyle(state: .original,
                                                  type: .match,
                                                  mainCard: .image,
                                                  thumbnailImgUrl: "도화가23",
                                                  ptrName: "심상갑",
                                                  point: newOrigin,
                                                  size: size2)
                            
                            shouldAnimate = true
                        }
                        .opacity(shouldAnimate ? 0 : 1)
                        .cornerRadius(12)
                        .background {
                            GeometryReader { imageProxy in
                                Color.clear
                                    .onAppear {
                                        let scrollData  = imageProxy.frame(in: .named("스크롤"))
                                        imageOrigin2 = scrollData.origin
                                        size2 = scrollData.size
                                    }
                            }
                        }
                        .padding(.top, 12)
                        .padding(.leading, 12)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .background {
                    GeometryReader { stackProxy in
                        Color.clear
                            .onAppear {
                                scrollviewSize = stackProxy.frame(in: .named("스크롤")).size
                            }
                    }
                }
            }
            .frame(width: scrollviewSize.width, height: scrollviewSize.height, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .coordinateSpace(name: "스크롤")
        .overlay {
            if shouldAnimate {
                LikeView(openState: $shouldAnimate,
                         style: style)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
