// ********************** PDFHandler *********************************
// * Copyright © 4BitCrew, LLC - All Rights Reserved
// * Created on 8/29/23, for 
// * Matthew Elmore <matt@4bitCrew.com>
// * Unauthorized copying of this file is strictly prohibited
// ********************** PDFHandler *********************************


import Foundation
import PDFKit

public struct PDFHandler {
    
    static public func getPdfContentsAsString(from: URL?) -> String? {
        let errorMessage = "could not get string from pdf"
        guard let from else { print(errorMessage); return nil }
        guard let pdf = PDFDocument(url: from)?.string else { print(errorMessage); return nil }
        return pdf
    }
    
    static public func getAttributedPDFContents(from: URL?) -> NSMutableAttributedString? {
        guard let url = from else { return nil }
        var result: NSMutableAttributedString?
        if let pdf = PDFDocument(url: url) {
            let pageCount = pdf.pageCount
            let documentContent = NSMutableAttributedString()

            for i in 0 ..< pageCount {
                guard let page = pdf.page(at: i) else { continue }
                guard let pageContent = page.attributedString else { continue }
                documentContent.append(pageContent)
            }
            result = documentContent
        }
        return result
    }
    
    static public func getPdfPages(pdf: URL?, start: Int?, numOfPages: Int?) -> String? {
        guard let pdf else { return nil }
        guard let start = start else { return nil }
        guard let numOfPages = numOfPages else { return nil }
        var result = ""
        guard let pdf = PDFDocument(url: pdf) else { return nil }
        for i in 0..<numOfPages {
            result += pdf.page(at: start + i)?.string ?? ""
        }
        return result
    }
    
    
    static public func getPageCount(from: URL?) -> Int {
        guard let from else { return 0 }
        guard let pdf = PDFDocument(url: from) else { return 0 }
        return pdf.pageCount
    }
    
    static public func getFirstPageWith(string: String, from: URL?) -> Int? {
        guard let from else { return nil }
        guard let pdf = PDFDocument(url: from) else { return nil }
        let count = pdf.pageCount
        for i in 0..<count {
            let searchPage = pdf.page(at: i)?.string ?? ""
            if searchPage.containsMatch(of: string) {
                return i
            }
        }
        return nil
    }
    
//    static func highlightMatches(for pattern: String) -> NSAttributedString {
//      guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
//        return NSMutableAttributedString(string: self)
//      }
//      
//      let range = NSRange(self.startIndex..., in: self)
//      let matches = regex.matches(in: self, options: [], range: range)
//      
//      let attributedText = NSMutableAttributedString(string: self)
//      
//      for match in matches {
//        attributedText.addAttribute(.backgroundColor, value: Color.yellow, range: match.range)
//      }
//      
//      return attributedText.copy() as! NSAttributedString
//    }
}

