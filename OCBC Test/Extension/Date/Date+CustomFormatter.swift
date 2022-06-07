//
//  File.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation

extension String {

    func toDateString(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd MMMM yyyy"
        let stringDate = dateStringFormatter.string(from: date ?? Date())
        
        return stringDate

    }
    
    func getFormattedDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatter.date(from: dateString) else { return Date() }

        return date
     }
}

   

