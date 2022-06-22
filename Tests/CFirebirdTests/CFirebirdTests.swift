import XCTest
@testable import CFirebird

final class CFirebirdTests: XCTestCase {
	
	func testFunctionCall() {
		var status: [ISC_STATUS] = Array(repeating: 0, count: Int(ISC_STATUS_LENGTH))
		isc_print_status(&status)
		let sqlCode = isc_sqlcode(&status)
		XCTAssertEqual(sqlCode, -999)
	}
	
	func testCodingTimestamp() {
		var rawTime: time_t = 0
		withUnsafeMutablePointer(to: &rawTime) {
			time($0)
			return
		}
		
		guard let unsafeTimeInfo = gmtime(&rawTime) else {
			return XCTFail()
		}
				
		var encodedTimestamp: ISC_TIMESTAMP = .init()
		withUnsafeMutablePointer(to: &encodedTimestamp) {
			isc_encode_timestamp(unsafeTimeInfo, $0)
		}
	
		var decodedTimeInfo: tm = .init()
		withUnsafeMutablePointer(to: &decodedTimeInfo) {
			isc_decode_timestamp(&encodedTimestamp, $0)
		}

		let rawTime2 = timegm(&decodedTimeInfo)
		XCTAssertEqual(rawTime, rawTime2)
	}
}
