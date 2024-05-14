// The Swift Programming Language
// https://docs.swift.org/swift-book

import Darwin
import Foundation

public class STRFTimeFormatter {
    public var formatString = "%Y-%m-%dT%H:%M:%S%z"
    public var useUniversalTimeLocale = false
    
    public init() {
        
    }
    
    public func date(from string: String) -> Date {
        var timeInterval: time_t;
        var time = tm()
        
        
        _ = string.withCString { str in
            strptime_l(str, formatString, &time, nil)
        }
        
        timeInterval = useUniversalTimeLocale ? timegm(&time): mktime(&time)
        
        return Date(timeIntervalSince1970: Double(timeInterval))
    }
    
    
    public func string(from date: Date) -> String {
        var timeInterval: time_t = time_t(date.timeIntervalSince1970)
        let time = self.useUniversalTimeLocale ? gmtime(&timeInterval) : localtime(&timeInterval)
        
        let buffer = String(repeating: " ", count: 80)
        
        return buffer.withCString { buf in
            let pointer = UnsafeMutablePointer(mutating: buf)
            strftime_l(pointer, 80, formatString, time, nil)
            return String(cString: pointer)
        }
    }
}
