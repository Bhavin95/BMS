//
//  BMCStyleColor.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

public struct APPStyle {
    public struct Color {
        static let themeCardBackgroundColor = UIColor(named: "themeCardBackgroundColor")!
        static let themeShadowColor = UIColor(named: "themeShadowColor")!
        public static let disabledGrey = #colorLiteral(red: 0.3647058824, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        public static let darkGrey = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        public static let darkestGrey = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        public static let selectedStateGrey = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        public static let textGrey = #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1)
        public static let lightestGrey = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        public static let error = #colorLiteral(red: 0.968627451, green: 0.3725490196, blue: 0.3725490196, alpha: 1)
        public static let success = #colorLiteral(red: 0.06274509804, green: 0.6470588235, blue: 0.2274509804, alpha: 1)
        public static let progressYellow = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.02745098039, alpha: 1)
        public static let turquoise = #colorLiteral(red: 0.1411764706, green: 0.6274509804, blue: 0.5647058824, alpha: 1)
        public static let green = #colorLiteral(red: 0.4156862745, green: 0.8039215686, blue: 0.5254901961, alpha: 1)
        public static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let tabBackgroundColor = #colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05098039216, alpha: 1)
        public static let purpleOverlay = #colorLiteral(red: 0.5098039216, green: 0.2549019608, blue: 1, alpha: 1)
        public static let purpleOverlayTwo = #colorLiteral(red: 0.4235294118, green: 0.1568627451, blue: 0.937254902, alpha: 1)
        public static let lightBlack = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.003)
        public static let mediumGrey = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        public static let backgroundStartGradient = #colorLiteral(red: 0.06274509804, green: 0.06666666667, blue: 0.07843137255, alpha: 1)
        public static let backgroundEndGradient = #colorLiteral(red: 0.0431372549, green: 0.04705882353, blue: 0.05882352941, alpha: 1)
        public static let separatorWhite24 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.24)
        public static let goldenYellow = #colorLiteral(red: 1, green: 0.7921568627, blue: 0, alpha: 1)
        public static let secondaryPurple = #colorLiteral(red: 0.2, green: 0.4039215686, blue: 0.6823529412, alpha: 1)
        public static let inclusionHeaderBackground = #colorLiteral(red: 0.05098039216, green: 0.05490196078, blue: 0.06274509804, alpha: 1)
        public static let notificationDot = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        public static let darkVariantGrey = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        public static let modified = #colorLiteral(red: 0.9098039216, green: 0.6823529412, blue: 0, alpha: 1)
        
        // Line
        public static let lineGrey = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
        public static let lineDisabled = #colorLiteral(red: 0.3254901961, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        public static let lineWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.24)
        
        // Gradient
        public static let widgetGradientTop = #colorLiteral(red: 0.168627451, green: 0.1764705882, blue: 0.2078431373, alpha: 1) // 43, 45, 53
        public static let widgetGradientBottom = #colorLiteral(red: 0.09019607843, green: 0.09803921569, blue: 0.1294117647, alpha: 1) // 23, 25, 33
        
        // Gradient View
        public static let viewGradientTop = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.1882352941, alpha: 1)
        public static let viewGradientBottom = #colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1333333333, alpha: 1)
        
        public static let purpleGradientTop = #colorLiteral(red: 0.6196078431, green: 0.4196078431, blue: 0.9960784314, alpha: 1)
        public static let purpleGradientBottom = #colorLiteral(red: 0.4549019608, green: 0.1725490196, blue: 1, alpha: 1)
        
        public static let purpleDarkerGradientTop = #colorLiteral(red: 0.2039215686, green: 0.09803921569, blue: 0.3647058824, alpha: 1)
        public static let purpleDarkerGradientBottom = #colorLiteral(red: 0.5058823529, green: 0.3137254902, blue: 0.8117647059, alpha: 1)
        public static let backgroundGradientTop = #colorLiteral(red: 0.165, green: 0.176, blue: 0.204, alpha: 1)
        public static let backgroundGradientBottom = #colorLiteral(red: 0.0431372549, green: 0.04705882353, blue: 0.06, alpha: 1)
        
        public static let blueGradientTop = #colorLiteral(red: 0.08235294118, green: 0.2705882353, blue: 0.4392156863, alpha: 1)
        public static let blueGradientBottom = #colorLiteral(red: 0.4078431373, green: 0.6, blue: 0.7725490196, alpha: 1)
        
        public static let borderGrey = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
        public static let lightWhite = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        public static let clear = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        public static let homePageChildCell = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        public static let secondaryLightGreyText = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
        
        public static let homeTabBarInactiveTextColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1) // 189,189,189
        public static let homeTabBarActiveTextColor = #colorLiteral(red: 0.6039215686, green: 0.3921568627, blue: 1, alpha: 1) // 154,100,255
        
        public static let viewBackgroundGradientTop = #colorLiteral(red: 0.06274509804, green: 0.06666666667, blue: 0.07843137255, alpha: 1) // 16, 17, 20
        public static let viewBackgroundGradientBottom = #colorLiteral(red: 0.0431372549, green: 0.04705882353, blue: 0.05882352941, alpha: 1) // 11, 12, 15
        public static let avatarTextColor = #colorLiteral(red: 0.862745098, green: 0.7882352941, blue: 1, alpha: 1)
        
        public static let gradientViewTop = #colorLiteral(red: 0.062, green: 0.067, blue: 0.08, alpha: 1)
        public static let gradientViewBottom = #colorLiteral(red: 0.042, green: 0.045, blue: 0.06, alpha: 1)
        
        public static let disabledWhiteColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        public static let blueColor = #colorLiteral(red: 0.07450980392, green: 0.462745098, blue: 1, alpha: 1)
        public static let navBarColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        public static let darkPurpleColor = #colorLiteral(red: 0.3450980392, green: 0.2509803922, blue: 0.4980392157, alpha: 1)
        public static let secondayDarkestGrey = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        public static let secondaryDarkGrey = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        public static let secondaryDarkGrey1 = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1).withAlphaComponent(0.48)
        public static let secondaryDarkGrey2 = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1).withAlphaComponent(0.01)
        public static let secondaryMediumGrey = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        public static let greyStyle1 = #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        public static let greyStyle2 = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        public static let greyStyle3 = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        public static let greyStyle4 = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        public static let secondaryLightGrey = #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1)
        public static let secondaryLightGreyII = #colorLiteral(red: 0.631372549, green: 0.631372549, blue: 0.631372549, alpha: 1) // A1A1A1, 100%
        public static let fadedLightGrey = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        public static let secondaryLightMediumGrey = #colorLiteral(red: 0.5607843137, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        
        public static let secondaryLightestGrey = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        public static let secondaryRed = #colorLiteral(red: 0.968627451, green: 0.3725490196, blue: 0.3725490196, alpha: 1)
        public static let secondaryGreen = #colorLiteral(red: 0.06274509804, green: 0.6470588235, blue: 0.2274509804, alpha: 1)
        public static let secondaryGreen1 = #colorLiteral(red: 0.2941176471, green: 0.6549019608, blue: 0.6588235294, alpha: 1)
        public static let secondaryGreen2 = #colorLiteral(red: 0.4156862745, green: 0.8039215686, blue: 0.5254901961, alpha: 1)
        public static let secondaryMedium = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        public static let primaryPurple = #colorLiteral(red: 0.662745098, green: 0.5647058824, blue: 0.8156862745, alpha: 1)
        public static let primaryPurple2 = #colorLiteral(red: 0.5098039216, green: 0.2549019608, blue: 1, alpha: 1)
        public static let secondaryWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        public static let secondaryWhite1 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.2)
        public static let secondaryWhite2 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.48)
        public static let secondaryWhite3 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.08)
        public static let secondaryWhite4 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.05)
        public static let darkRed = #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 1)
        public static let greyishBrown = #colorLiteral(red: 0.3996260166, green: 0.39963606, blue: 0.3996306658, alpha: 1)
        public static let darkBlue = #colorLiteral(red: 0.08235294118, green: 0.2705882353, blue: 0.4392156863, alpha: 1)
        public static let lightBlue = #colorLiteral(red: 0.4078431373, green: 0.6, blue: 0.7725490196, alpha: 1)
        
        public static let tertiaryDarkGrey = #colorLiteral(red: 0.184, green: 0.184, blue: 0.184, alpha: 1)
        public static let goldBright = #colorLiteral(red: 0.7568627451, green: 0.6705882353, blue: 0.5019607843, alpha: 1)
        public static let goldDark = #colorLiteral(red: 0.5529411765, green: 0.4470588235, blue: 0.2862745098, alpha: 1)
        public static let primaryDarkGrey = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
        public static let graylight = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        public static let yellowBright = #colorLiteral(red: 0.9882352941, green: 0.8196078431, blue: 0.4666666667, alpha: 1)
        public static let primaryYellow = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        public static let thinWhiteColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.04)
        public static let blurEffectColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3490196078, alpha: 0.8002310739)
        public static let navBarAlternateColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1) // 38,38,38
        public static let upperDarkGradientColor = #colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1333333333, alpha: 1) // 25,27,34
        public static let bottomLightGradientColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.1882352941, alpha: 1) // 41,43,48
        public static let appBackgroundLightGradient = #colorLiteral(red: 0.06274509804, green: 0.06666666667, blue: 0.07843137255, alpha: 1) // 16,17,20
        public static let appBackgroundDarkGradient = #colorLiteral(red: 0.0431372549, green: 0.04705882353, blue: 0.05882352941, alpha: 1) // 11,12,15
        public static let progressYellowV2 = #colorLiteral(red: 0.9098039216, green: 0.6823529412, blue: 0, alpha: 1) // 232,174,0
        public static let secondaryGreenV2 = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.2117647059, alpha: 1) // 0,176,54
        public static let homeTemplateFiveLightGradient = #colorLiteral(red: 0.7647058824, green: 0.768627451, blue: 0.7725490196, alpha: 1) // 195,196,197
        public static let homeTemplateFiveDarkGradient = #colorLiteral(red: 0.7725490196, green: 0.7764705882, blue: 0.7803921569, alpha: 1) // 197,198,199
    }
}
