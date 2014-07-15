//
//  regex+string.swift
//  TicketDraw
//
//  Created by Jon Grenning on 15/07/14.
//  Copyright (c) 2014 Jon Grenning. All rights reserved.
//

import Foundation

extension String {
    func exec (str: String) -> Array<String> {
        var err : NSError?
        let regex = NSRegularExpression(pattern: self, options: NSRegularExpressionOptions(0), error: &err)
        if err {
            return Array<String>()
        }
        let nsstr = str as NSString
        let all = NSRange(location: 0, length: nsstr.length)
        var matches : Array<String> = Array<String>()
        regex.enumerateMatchesInString(str, options: NSMatchingOptions(0), range: all) {
            (result : NSTextCheckingResult!, _, _) in
            matches.append(nsstr.substringWithRange(result.range))
        }
        return matches
    }
}