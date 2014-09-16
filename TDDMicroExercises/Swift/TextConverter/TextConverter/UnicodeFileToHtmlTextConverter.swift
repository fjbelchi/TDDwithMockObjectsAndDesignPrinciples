//
//  UnicodeFileToHtmlTextConverter.swift
//  TextConverter
//
//  Created by fjbelchi on 16/09/14.
//  Copyright (c) 2014 Francisco Jose Belchi Martinez. All rights reserved.
//

import Foundation

public class UnicodeFileToHtmlTextConverter {
    
    private let fullFilenameWithPath : String
    
    public init(fullFilenameWithPath:String) {
        self.fullFilenameWithPath = fullFilenameWithPath
    }
    
    public func convertToHtml() -> String {
        let reader = StreamReader(path: self.fullFilenameWithPath)
        
        var line = reader.nextLine()
        var html = ""
        
        while let newLine = line {
            if let escapesString = newLine.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
                html += escapesString
            }
            html += "<br />"
            line = reader.nextLine()
        }
        
        return html
    }
}