//
//  Model.swift
//  TestAnimation
//
//  Created by Gab on 2024/02/23.
//

import SwiftUI

@frozen public enum LikeCardState: Equatable {
    case original
    case delete
}

@frozen public enum LikeCardType: Equatable {
    case match
    case Like
}

@frozen public enum LikeMainCardType: Equatable {
    case image
    case video
    case text
}

@frozen public enum LikeAmberType: Equatable {
    case free
    case amber
    case amberWithfree
}

@frozen public struct LikeAboutMeStyle {
    public static let zero = LikeAboutMeStyle(top: 0, leading: 0, trailing: 0, bottom: 0, size: .zero, color: .white248)
    
    public let top: CGFloat
    public let leading: CGFloat
    public let trailing: CGFloat
    public let bottom:CGFloat
    public let size: CGSize
    public let color: Color
    
    public init(top: CGFloat,
                leading: CGFloat,
                trailing: CGFloat,
                bottom: CGFloat,
                size: CGSize,
                color: Color) {
        self.top = top
        self.leading = leading
        self.trailing = trailing
        self.bottom = bottom
        self.size = size
        self.color = color
    }
}

public extension LikeAboutMeStyle {
    
    func horizontal() -> CGFloat {
        return leading + trailing
    }
    
    func vertical() -> CGFloat {
        return top + bottom
    }
}

@frozen public struct LikeSendStyle {
    
    public static let zero = LikeSendStyle(state: .original, type: .Like, mainCard: .image, point: .zero, size: .zero)
    
    public let state: LikeCardState
    public let type: LikeCardType
    public let mainCard: LikeMainCardType
    public let amberType: LikeAmberType
    
    public let thumbnailImgUrl: String
    public let videoUrl: String
//    public let thumbnailImgUrl: URL
//    public let videoUrl: URL
    public let comment: String
    public let aboutMe: String
    
    public let ptrName: String
    public let point: CGPoint
    public let size: CGSize
    
    public let aboutMeStyle: LikeAboutMeStyle
    
    public init(state: LikeCardState,
                type: LikeCardType,
                mainCard: LikeMainCardType,
                amberType: LikeAmberType = .free,
                thumbnailImgUrl: String = "",
                videoUrl: String = "",
                comment: String = "",
                aboutMe: String = "",
                ptrName: String = "",
                point: CGPoint,
                size: CGSize,
                aboutMeStyle: LikeAboutMeStyle = .zero) {
        self.state = state
        self.type = type
        self.mainCard = mainCard
        self.amberType = amberType
        self.thumbnailImgUrl = thumbnailImgUrl
        self.videoUrl = videoUrl
        self.comment = comment
        self.aboutMe = aboutMe
        self.ptrName = ptrName
        self.point = point
        self.size = size
        self.aboutMeStyle = aboutMeStyle
    }
}
