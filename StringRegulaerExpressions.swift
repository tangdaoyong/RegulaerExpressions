//
//  StringRegulaerExpressions.swift
//  RegularExpressions
//
//  Created by 唐道勇 on 2017/9/5.
//  Copyright © 2017年 唐道勇. All rights reserved.
//

import UIKit

// MARK: - 正则匹配扩展
extension String {
    
    // MARK: - 正则表达式和NSPerdicate(谓词)连用匹配
    /// 正则表达式和NSPerdicate(谓词)连用匹配
    ///
    /// - parameter myRegularExpressions:正则表达式
    ///
    /// - Returns: 匹配成功或失败
    @available (*, introduced: 9.0)
    func yx_perdicate(_ myRegularExpressions:String) ->Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", myRegularExpressions)
        if predicate.evaluate(with: self) == true {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配成功")
            return true
        } else {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配失败")
            return false
        }
//        return predicate.evaluate(with: self)//不需要打印时你可以直接返回
    }
    
    // MARK: - 直接查找匹配
    /// 直接查找匹配
    ///
    /// - parameter myRegularExpressions:正则表达式
    ///
    /// - Returns: 匹配成功或失败
    @available (*, introduced: 9.0)
    func yx_rangeOfString(_ myRegularExpressions:String) ->Bool {
        let range = self.range(of: myRegularExpressions, options: String.CompareOptions.regularExpression, range: nil, locale: nil)
        if range != nil {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配成功")
            return true
        } else {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配失败")
            return false
        }
//        return range != nil
    }
    
    // MARK: - 谓词查找
    /// 谓词查找
    ///
    /// - parameter myRegularExpressions:正则表达式
    ///
    /// - Returns: 匹配成功或失败
    @available (*, introduced: 9.0)
    func yx_regularExpressions(_ myRegularExpressions:String, options:NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) throws ->Bool {
        var myRE:NSRegularExpression!
        try myRE = NSRegularExpression.init(pattern: myRegularExpressions, options: options)//NSRegularExpression.Options.caseInsensitive不区分大小写的搜索
        let result = myRE.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange.init(location: 0, length: self.characters.count))
        //let resultArr = myRE.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange.init(location: 0, length: self.characters.count))//抓取多个结果
        if result != nil {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配成功")
            return true
        } else {
            YXPrint("规则:" + myRegularExpressions + "目标字符串：" + self + "匹配失败")
            return false
        }
//        return result != nil
    }
    
//    // MARK: - 密码条件判断(字母和数字6-20位)
//    /// 密码匹配
//    ///
//    /// - parameter password:输入密码
//    ///
//    /// - Returns: 匹配成功或失败
//    static func yx_isGoodPasswrod(_ password:String) ->Bool {
//        let myRegularExpressionsStr = "^(?![^A-Za-z]+$)(?![^0-9]+$)(?=.*[a-zA-Z])(?=.*[0-9])[\\x21-\\x7e]{6,20}$"//不能全字母-不能全数字-要有字母-要有数字-（\x21-\x7e）都可以，6到20位
//        do {
//            return try password.yx_regularExpressions(myRegularExpressionsStr)
//        } catch {
//            return false
//        }
//    }
}
