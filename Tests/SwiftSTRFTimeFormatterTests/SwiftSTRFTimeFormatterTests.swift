import XCTest
@testable import SwiftSTRFTimeFormatter

final class SwiftSTRFTimeFormatterTests: XCTestCase {
    func testDateFromString1() throws {
        let formatter = STRFTimeFormatter()
        let date = formatter.date(from: "2011-3-16T12:11:33")
        let components = Calendar.current.dateComponents(in: .current, from: date)
        assert(components.year == 2011)
        assert(components.month == 3)
        assert(components.day == 16)
        assert(components.hour == 12)
        assert(components.minute == 11)
        assert(components.second == 33)
        assert(components.nanosecond == 0)
    }
    
    func testDateToString1() throws {
        let formatter = STRFTimeFormatter()
        let date = formatter.date(from: "2011-3-16T12:11:33")

        let string = formatter.string(from: date)
        
        assert(string == "2011-03-16T12:11:33+0200")
    }
}
