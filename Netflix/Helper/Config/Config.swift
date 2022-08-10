//
//  Config.swift
//  StockApp
//
//  Created by Devangi Prajapati on 04/08/22.
//

import Foundation
import UIKit

struct Config
{
  private init() {}

  //MARK: - Font
  static let raleway_Black               = "Raleway-Black"
  static let raleway_Bold                = "Raleway-Bold"
  static let raleway_Light               = "Raleway-Light"
  static let raleway_Medium              = "Raleway-Medium"
  static let raleway_Regular             = "Raleway-Regular"

  //MARK: -  Idiom
  static let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom

  // MARK: - Color palette
  static let whiteColor                   = UIColor.white
  static let DarkGrayColor                = UIColor.darkGray
  static let GrayColor                    = UIColor.gray
  static let RedColor                     = UIColor.red
  static let LightGrayColor               = UIColor.lightGray
  static let LightTextColor               = UIColor.lightText
  static let BlueColor                    = UIColor.blue
  static let GreenColor                   = UIColor.green
  static let OrangeColor                  = UIColor.orange
  static let PurpleColor                  = UIColor.purple
  static let BlackColor                   = UIColor.black
  static let ClearColor                   = UIColor.clear
  static let btnBgColor                   =  UIColor(red:255, green:0, blue:153, alpha:1.0)
  static let viewBgColor                  = UIColor(red:243, green:243, blue:244, alpha:1.0)
  static let veiwBgColor                  =  UIColor(red:241, green:241, blue:241, alpha:1.0)
  static let btnHomeColor                 =  UIColor(red:44, green:110, blue:173, alpha:1.0)


  static let FONTBOLD10 = UIFont(name: Config.raleway_Bold, size: 10)
  static let FONTBOLD12 = UIFont(name: Config.raleway_Bold, size: 12)
  static let FONTBOLD14 = UIFont(name: Config.raleway_Bold, size: 14)
  static let FONTBOLD16 = UIFont(name: Config.raleway_Bold, size: 16)
  static let FONTBOLD18 = UIFont(name: Config.raleway_Bold, size: 18)
  static let FONTBOLD20 = UIFont(name: Config.raleway_Bold, size: 20)
  static  let FONTBOLD22 = UIFont(name: Config.raleway_Bold, size: 22)
  static  let FONTBOLD24 = UIFont(name: Config.raleway_Bold, size: 24)

  static let FONTREGULAR10 =  UIFont(name: Config.raleway_Regular, size: 10)
  static let FONTREGULAR12 =  UIFont(name: Config.raleway_Regular, size: 12)
  static let FONTREGULAR14 =  UIFont(name: Config.raleway_Regular, size: 14)
  static let FONTREGULAR16 =  UIFont(name: Config.raleway_Regular, size: 16)
  static let FONTREGULAR18 =  UIFont(name: Config.raleway_Regular, size: 18)
  static let FONTREGULAR20 =  UIFont(name: Config.raleway_Regular, size: 20)
  static let FONTREGULAR22 =  UIFont(name: Config.raleway_Regular, size: 22)

}
